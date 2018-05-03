package zyj.biyesheji0425.mapper;

import zyj.biyesheji0425.pojo.Crawl;
import zyj.biyesheji0425.pojo.CrawlKey;

public interface CrawlMapper {
    int deleteByPrimaryKey(CrawlKey key);

    int insert(Crawl record);

    int insertSelective(Crawl record);

    Crawl selectByPrimaryKey(CrawlKey key);

    int updateByPrimaryKeySelective(Crawl record);

    int updateByPrimaryKey(Crawl record);
}