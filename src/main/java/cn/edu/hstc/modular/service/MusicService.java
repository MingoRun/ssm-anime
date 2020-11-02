package cn.edu.hstc.modular.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.hstc.modular.entity.Music;

/**
 * 音乐Service接口类
 * @author Runming
 *
 */
public interface MusicService {
	//查询所有音乐信息
	public List<Music> selectMusicAll(Music music);
	
	//添加音乐信息（后期记得加入用户id）
	public int addMusic(Music music);
	
	//根据id号删除音乐信息
	public int deleteMusicById(int musicId);
	
	//根据id号查询音乐文件地址
	public String selectMusicUrlById(int musicId);
	
	//根据id号查询音乐封面地址
	public String selectCoverUrlById(int musicId);
	
	//前台查询10条音乐信息
	public List<Music> selectTenMusic();
	
	//根据上传时间查询所有音乐信息
	public List<Music> selectMusicAllByUploadTime();
	
	//根据id查询音乐信息
	public Music selectMusicById(int musicId);
	
	//更新播放次数
	public int updatePlayCountById(Music music);
	
	//更新下载次数
	public int updateDownLoadCountById(Music music);
	
	//根据搜索内容查询音乐信息
	public List<Music> selectMusicAllByContent(@Param("content")String content);
	
	//根据用户id查询音乐id和名称
	public List<Music> selectNameAndIdByUserId(int userId);
}
