package com.ffaikrw.instagram.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ffaikrw.instagram.common.FileManagerService;
import com.ffaikrw.instagram.post.comment.bo.CommentBO;
import com.ffaikrw.instagram.post.dao.PostDAO;
import com.ffaikrw.instagram.post.like.bo.LikeBO;
import com.ffaikrw.instagram.post.model.Post;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private LikeBO likeBO;
	
	// 타임라인
	public List<Post> getTimeline() {
		
		// 포스트마다 댓글, 좋아요 가져오기
		
		
		// 그 정보를 하나의 새로운 데이터 클래스(DTO)를 만들어서 구성
		
		// 새로운 DTO를 리스트 형태로 구성
		
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
	
	

}
