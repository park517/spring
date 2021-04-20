package com.example.starter.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.junit.platform.commons.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.starter.dto.Article;
import com.example.starter.dto.CommentDto;
import com.example.starter.dto.FileDto;
import com.example.starter.dto.Member;
import com.example.starter.service.ArticleService;
import com.example.starter.service.CUtil;
import com.example.starter.service.CommentService;
import com.example.starter.service.FileService;

import lombok.extern.slf4j.Slf4j;



@Controller
@Slf4j //이걸 해야 log.info(.._) 가 가능 , 디버깅 용도
public class ArticleController {
	@Autowired
	ArticleService articleService;
	
	@Autowired
	FileService fileService;
	
	@Autowired
	CommentService commentService;
	
	
	
	// 게시물 리스트 가져오기
	@RequestMapping("/article/list")
	public String showList(Model model) {
		List<Article> list = articleService.getList();
		model.addAttribute("list",list);
		model.addAttribute("totalCount",list.size());
		log.info("list : "+list);
		return "article/list";
	}
	
	// id에 맞는 게시물 가져오기
	@RequestMapping("/article/detail")
	public String showDetail(Model model , long aid) {
		FileDto file = fileService.getFile(aid);
		Article article = articleService.getOne(aid);
		List<CommentDto> list = commentService.getComment(aid);
		articleService.hitUp(aid);
		model.addAttribute("file",file);
		model.addAttribute("article", article);
		model.addAttribute("commentList",list);
		return "article/detail";
	}
	
	// 게시물 추가하기
	@RequestMapping("/article/add")
	public String showAdd() {
		return "article/add";
	}
	
	@RequestMapping("/article/doAdd")
	@ResponseBody
	public String doAdd(@RequestParam Map<String , Object> param , @RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
		//Rquest는 오브젝트 타입이므로 키는 form의 name object는 그의 value 값이다
		FileDto fd = new FileDto();
		long newId= articleService.add(param);
		if(file != null) {
		    String sourceFileName = file.getOriginalFilename(); 
		    String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase(); 
		    File destinationFile; 
		    String destinationFileName;
		    String fileUrl = "C:/BrowserSpace301/starter/src/main/webapp/WEB-INF/upload/";
	        do { 
	            destinationFileName =UUID.randomUUID().toString().replaceAll("-", "") + "." + sourceFileNameExtension; 
	            destinationFile = new File(fileUrl + destinationFileName); 
	        } while (destinationFile.exists()); 
	        
	        destinationFile.getParentFile().mkdirs(); 
	        file.transferTo(destinationFile);
	        fd.setAid(newId);
	        fd.setFileName(destinationFileName);
	        fd.setFileRealName(sourceFileName);
	        fd.setPath(fileUrl);
	        
	        fileService.insertFile(fd);
			
		}
		
		String msg = newId+ "번 게시물이 추가되었습니다";
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("alert('"+msg+"');");
		sb.append("location.replace('./detail?aid="+newId+"');");
		sb.insert(0, "<script>");
		sb.append("</script>");
		
		return sb.toString();
	}
	
	// 게시물 삭제하기
	@RequestMapping("/article/doDelete")
	@ResponseBody
	public String doDelete(long aid) {
		articleService.delete(aid);

		String msg = aid + "번 게시물이 삭제되었습니다.";

		StringBuilder sb = new StringBuilder();

		sb.append("alert('" + msg + "');");
		sb.append("location.replace('./list');");

		sb.insert(0, "<script>");
		sb.append("</script>");

		return sb.toString();
	}
	
	// 게시물 수정 페이지 이동
	@RequestMapping("/article/modify")
	public String modify(Model model , long aid) {
		Article article = articleService.getOne(aid);
		model.addAttribute("article",article);
		return "article/modify";
	}

	// 게시물 수정
	
	@RequestMapping("/article/doModify")
	@ResponseBody
	public String doModify(@RequestParam Map<String, Object> param, long aid) {
		articleService.modify(param);

		String msg = aid + "번 게시물이 수정되었습니다.";

		StringBuilder sb = new StringBuilder();

		sb.append("alert('" + msg + "');");
		sb.append("location.replace('./detail?aid=" + aid + "');");

		sb.insert(0, "<script>");
		sb.append("</script>");

		return sb.toString();
	}
	
	
	
	//-------------------------------댓글 영역---------------------------------//
	
	//댓글 달기
	@RequestMapping("/article/doAddComment")
	@ResponseBody
	public String doAddComment(@RequestParam Map<String, Object> param, HttpSession session) {
		CommentDto commentdto = new CommentDto();
		long aid = CUtil.getAsLong(param.get("aid"));
		Member member = (Member)session.getAttribute("loginMember");
		String mid = member.getMid();
		String scontents = (String) param.get("comment");
		
		commentdto.setAid(aid);
		commentdto.setMid(mid);
		commentdto.setScontents(scontents);
		commentService.addComment(commentdto);
		
		String msg = "댓글이 추가되었습니다";
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("alert('"+msg+"');");
		sb.append("location.replace('./detail?aid="+aid+"');");
		sb.insert(0, "<script>");
		sb.append("</script>");
		
		return sb.toString();
	}
	
	
	// 게시물 삭제하기
	@RequestMapping("/article/deleteComment")
	@ResponseBody
	public String deleteComment(long aid) {
		articleService.delete(aid);

		String msg = aid + "번 게시물이 삭제되었습니다.";

		StringBuilder sb = new StringBuilder();

		sb.append("alert('" + msg + "');");
		sb.append("location.replace('./list');");

		sb.insert(0, "<script>");
		sb.append("</script>");

		return sb.toString();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	//파일 다운로드
	@RequestMapping("/article/fileDown/{aid}")
    private void fileDown(@PathVariable long aid, HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        request.setCharacterEncoding("UTF-8");
        FileDto fileDto = fileService.getFile(aid);
        
        //파일 업로드된 경로 
        try{
            String fileUrl = fileDto.getPath();
            fileUrl += "/";
            String savePath = fileUrl;
            String fileName = fileDto.getFileName();
            
            //실제 내보낼 파일명 
            String oriFileName = fileDto.getFileRealName();
            InputStream in = null;
            OutputStream os = null;
            File file = null;
            boolean skip = false;
            String client = "";
            
            //파일을 읽어 스트림에 담기  
            try{
                file = new File(savePath, fileName);
                in = new FileInputStream(file);
            } catch (FileNotFoundException fe) {
                skip = true;
            }
            
            client = request.getHeader("User-Agent");
            
            //파일 다운로드 헤더 지정 
            response.reset();
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Description", "JSP Generated Data");
            
            if (!skip) {
                // IE
                if (client.indexOf("MSIE") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                    // IE 11 이상.
                } else if (client.indexOf("Trident") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                } else {
                    // 한글 파일명 처리
                    response.setHeader("Content-Disposition",
                            "attachment; filename=\"" + new String(oriFileName.getBytes("UTF-8"), "ISO8859_1") + "\"");
                    response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
                }
                response.setHeader("Content-Length", "" + file.length());
                os = response.getOutputStream();
                byte b[] = new byte[(int) file.length()];
                int leng = 0;
                while ((leng = in.read(b)) > 0) {
                    os.write(b, 0, leng);
                }
            } else {
            	PrintWriter out = response.getWriter();
                response.setContentType("text/html;charset=UTF-8");
                out.print("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");
            }
            in.close();
            os.close();
        } catch (Exception e) {
            System.out.println("ERROR : " + e.getMessage());
        }
        
    }

	
	
	
}
