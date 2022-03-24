package com.ffaikrw.instagram.post.bo;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ffaikrw.instagram.common.FileManagerService;
import com.ffaikrw.instagram.post.dao.PostDAO;
import com.ffaikrw.instagram.post.model.Post;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	// 타임라인
	public List<Post> getTimeline() {
		return postDAO.selectAllPost();
	}
	
	
	// 게시물 작성
	public int addPost(int userId, String loginId, String content, MultipartFile file) {
		
		String imagePath = FileManagerService.saveFile(userId, file); 
		
		return postDAO.insertPost(userId, loginId, content, imagePath);
		
	}
	
	
	// 게시물 삭제
	public int deletePost(int id) {
		return postDAO.deletePost(id);
	}
	
	
	// 댓글 작성
	public int addComment(int postId, int userId, String loginId, String comment) {
		return postDAO.insertComment(postId, userId, loginId, comment);
	}
	
	
	// 댓글 보여주기
	public Comment 
	
}
