package com.michael.bookclub.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;



@Entity
@Table(name="books")
public class Book {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	 @NotEmpty(message="Title is required!")
	    @Size(min=2, max=30,  message="Title must be more than 2 characters")
	    private String title;
	    
	    @NotEmpty(message="Author is required!")
	    @Size(min=2, max=30,  message="Author must be more than 2 characters")
	    private String author;
	    
	    @NotEmpty(message="Your thoughts are required!")
	    @Size(min=2, max=200, message="Your thoughts must be more than 2 characters")
	    private String thoughts;
	    
//	    JOIN
		@ManyToOne(fetch = FetchType.LAZY)
	    @JoinColumn(name="owner_id")
	    private User owner;
		

		//		Dates
		@Column(updatable=false)
		@DateTimeFormat(pattern="yyyy-MM-dd")
		private Date createdAt;
		
		@Column(updatable=false)
		@DateTimeFormat(pattern="yyyy-MM-dd")
		private Date updatedAt;
		
		@PrePersist
		protected void onCreate() {
			this.createdAt = new Date();
		}
		@PreUpdate
		protected void onUpdate() {
			this.updatedAt = new Date();
		}
		
	    public Book () {}


		public Long getId() {
			return id;
		}


		public void setId(Long id) {
			this.id = id;
		}


		public String getTitle() {
			return title;
		}


		public void setTitle(String title) {
			this.title = title;
		}


		public String getAuthor() {
			return author;
		}


		public void setAuthor(String author) {
			this.author = author;
		}


		public String getThoughts() {
			return thoughts;
		}


		public void setThoughts(String thoughts) {
			this.thoughts = thoughts;
		}
		public User getOwner() {
			return owner;
		}
		public void setOwner(User owner) {
			this.owner = owner;
		}
		public Date getCreatedAt() {
			return createdAt;
		}
		public void setCreatedAt(Date createdAt) {
			this.createdAt = createdAt;
		}
		public Date getUpdatedAt() {
			return updatedAt;
		}
		public void setUpdatedAt(Date updatedAt) {
			this.updatedAt = updatedAt;
		}
	    
}
