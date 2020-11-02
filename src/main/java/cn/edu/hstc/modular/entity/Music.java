package cn.edu.hstc.modular.entity;

import java.io.Serializable;

/**
 * 音乐实体类
 * @author Runming
 *
 */
public class Music implements Serializable{

	/**
	 * 序列号id
	 */
	private static final long serialVersionUID = 484092242927529411L;

	private Integer musicId; //音乐id
	private String musicName;  //音乐名称
	private String musicSinger; //歌手
	private String musicUploadTime;   //上传时间
	private String musicUrl;   //音乐文件地址
	private Integer musicPlayCount;  //播放次数
	private Integer musicDownloadCount; //下载次数
	private String coverUrl;    //音乐封面存储地址
	private User user;                 //与用户相关的外键属性
	public Integer getMusicId() {
		return musicId;
	}
	public void setMusicId(Integer musicId) {
		this.musicId = musicId;
	}
	public String getMusicName() {
		return musicName;
	}
	public void setMusicName(String musicName) {
		this.musicName = musicName;
	}
	public String getMusicSinger() {
		return musicSinger;
	}
	public void setMusicSinger(String musicSinger) {
		this.musicSinger = musicSinger;
	}
	public String getMusicUploadTime() {
		return musicUploadTime;
	}
	public void setMusicUploadTime(String musicUploadTime) {
		this.musicUploadTime = musicUploadTime;
	}
	public String getMusicUrl() {
		return musicUrl;
	}
	public void setMusicUrl(String musicUrl) {
		this.musicUrl = musicUrl;
	}
	public Integer getMusicPlayCount() {
		return musicPlayCount;
	}
	public void setMusicPlayCount(Integer musicPlayCount) {
		this.musicPlayCount = musicPlayCount;
	}
	public Integer getMusicDownloadCount() {
		return musicDownloadCount;
	}
	public void setMusicDownloadCount(Integer musicDownloadCount) {
		this.musicDownloadCount = musicDownloadCount;
	}
	public String getCoverUrl() {
		return coverUrl;
	}
	public void setCoverUrl(String coverUrl) {
		this.coverUrl = coverUrl;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "Music [musicId=" + musicId + ", musicName=" + musicName + ", musicSinger=" + musicSinger
				+ ", musicUploadTime=" + musicUploadTime + ", musicUrl=" + musicUrl + ", musicPlayCount="
				+ musicPlayCount + ", musicDownloadCount=" + musicDownloadCount + ", coverUrl=" + coverUrl + ", user="
				+ user + "]";
	}
}
