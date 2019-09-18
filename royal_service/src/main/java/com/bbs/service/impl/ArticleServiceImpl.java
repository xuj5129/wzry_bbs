package com.bbs.service.impl;

import com.bbs.dao.ArticleDao;
import com.bbs.dao.CommentDao;
import com.bbs.dao.ReplyDao;
import com.bbs.dao.ReportDao;
import com.bbs.domain.Article;
import com.bbs.domain.Comment;
import com.bbs.domain.Reply;
import com.bbs.domain.Report;
import com.bbs.service.ArticleService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.text.SimpleDateFormat;

@Service("articleService")
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleDao articleDao;
    @Autowired
    private CommentDao commentDao;
    @Autowired
    private ReplyDao replyDao;
    @Autowired
    private ReportDao reportDao;


    //今日总帖子数
    @Override
    public int getNumOfTodayArticle() {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String format = sdf.format(date)+"%";
        return articleDao.getNumOfTodayArticle(format);
    }

    //改变帖子置顶状态
    @Override
    public void changeStatus(int id, Integer isTop) {
        if(isTop == 1){
            isTop = 0;
            articleDao.changeStatus(id,isTop);
        }else{
            isTop = 1;
            articleDao.changeStatus(id,isTop);
        }

    }

    //改变帖子屏蔽状态
    @Override
    public void deleteArticle(int id, Integer isReport) {
        if(isReport == 1){
            isReport = 0;
            articleDao.deleteArticle(id,isReport);
        }else{
            isReport = 1;
            articleDao.deleteArticle(id,isReport);
        }
    }


    //保存帖子
    @Override
    public void saveArticle(Article article) {
        article.setSendTime(new Date());
        articleDao.saveArticle(article);
        System.out.println(article);
    }

    //保存评论
    @Override
    public void saveComment(Comment comment) {
        comment.setCommentTime(new Date());
        commentDao.saveComment(comment);
    }

    ///保存回复
    @Override
    public void saveReply(Reply reply) {
        reply.setReplyTime(new Date());
        replyDao.saveReply(reply);
    }

    //查询帖子回复id
    @Override
    public int findArticleIdByCommentId(int commentId) {
        return commentDao.findArticleIdByCommentId(commentId);
    }

    //查询所有帖子
    @Override
    public List<Article> findAll(int page,int pageSize) {
        PageHelper.startPage(page,pageSize);
        return articleDao.findAll();
    }

    //查询没有被举报的帖子
    @Override
    public List<Article> findArticleNotReport(int zoneId) {
        return articleDao.findAllWhereNotReport(zoneId);
    }

    @Override
    public List<Article> findArticleByWord(String keyWord) {
        String word = "%"+keyWord + "%";
        return articleDao.findArticleByWord(word);

    }

    @Override
    public void saveReport(Report report) {
        report.setReportTime(new Date());
        reportDao.saveReport(report);
    }

    //查询总帖子数
    @Override
    public int getTotalArticleNum() {
        return articleDao.getTotalArticleNum();
    }

    ///通过帖子id查询帖子,并增加浏览数
    @Override
    public Article findById(Integer id) {
        articleDao.updateArticleBrowseCount(id);
        return articleDao.findById(id);
    }


    /**
     * 根据 帖子标题查询 帖子
     * @param title
     * @param sendername
     * @return
     * @throws Exception
     */
    @Override
    public List<Article> findByTitle(String title, String sendername) throws Exception {
        PageHelper.startPage(1,7);
        List<Article> articleList = articleDao.findByTicle("%"+title+"%","%"+sendername+"%");
        return articleList;
    }
}
