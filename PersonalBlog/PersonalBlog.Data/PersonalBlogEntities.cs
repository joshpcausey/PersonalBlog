﻿using PersonalBlog.Models.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PersonalBlog.Data
{
	class PersonalBlogEntities : DbContext
	{
		public PersonalBlogEntities()
		: base("PersonalBlog")
		{
		}

		public DbSet<Categories> Categories { get; set; }
		public DbSet<Images> Images { get; set; }
		public DbSet<Posts> Posts { get; set; }
		public DbSet<PostTags> PostTags { get; set; }
		public DbSet<Tags> Tags { get; set; }
	}
}