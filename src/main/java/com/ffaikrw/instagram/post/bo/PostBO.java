package com.ffaikrw.instagram.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ffaikrw.instagram.common.FileManagerService;
import com.ffaikrw.instagram.post.comment.bo.CommentBO;
import com.ffaikrw.instagram.post.dao.PostDAO;
import com.ffaikrw.instagram.post.like.bo.LikeBO;
import com.ffaikrw.instagram.post.model.Post;
import com.ffaikrw.instagram.post.model.PostDetail;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private LikeBO likeBO;
	
	// 타임라인
	public List<PostDetail> getTimeline(int userId) {
		
		List<Post> postList = postDAO.selectAllPost();
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		// 포스트마다 댓글, 좋아요 가져오기
		for (Post post : postList) {
			
			
			// postId를 이용해서 좋아요 개수, 댓글 리스트 조회
			int postId = post.getId();
			
			int likeCount = likeBO.getLikeCount(postId);
			
			// 해당 포스트에 로그인한 사용자가 좋아요를 눌렀는지 아닌지
			// postId와 session에 저장된 userId 가져오기
			boolean userLikeDuplicate = likeBO.likeIsDuplicate(postId, userId);
			
			PostDetail postDetail = new PostDetail();
			
			// post 데이터 setter
			postDetail.setPost(post);
			// => 마지막~첫번째 포스트까지 각 id, userId, loginId, content, imagePath, createdAt, updatedAt 정보가 postDetail 모델에 저장됨
			
			// 좋아요 개수 setter
			postDetail.setLikeCount(likeCount);
			
			// 댓글 리스트 set
			postDetail.setCommentList(commentBO.getCommentList(postId));
			
			// 세션에 저장된 사용자의 게시물 별 좋아요 여부 set
			postDetail.setUserLikeDuplicate(userLikeDuplicate);
			
			// 새로운 DTO를 리스트 형태로 구성
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
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
