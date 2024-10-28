package kr.co.sist.user.board;

/**
 * 현재페이지, 시작번호, 끝 번호, 검색컬럼, 검색값, 검색URL
 */
public class SearchVO {

	private int StartNum,endNum, CurrentPage, totalPage,totalCount;
	private String field="0",keyword,url;
	public int getStartNum() {
		return StartNum;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	public int getCurrentPage() {
		return CurrentPage;
	}
	public void setCurrentPage(int currentPage) {
		CurrentPage = currentPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public void setStartNum(int startNum) {
		StartNum = startNum;
	}
	@Override
	public String toString() {
		return "SearchVO [StartNum=" + StartNum + ", endNum=" + endNum + ", CurrentPage=" + CurrentPage + ", totalPage="
				+ totalPage + ", totalCount=" + totalCount + ", field=" + field + ", keyword=" + keyword + ", url="
				+ url + ", getStartNum()=" + getStartNum() + ", getEndNum()=" + getEndNum() + ", getCurrentPage()="
				+ getCurrentPage() + ", getTotalPage()=" + getTotalPage() + ", getTotalCount()=" + getTotalCount()
				+ ", getField()=" + getField() + ", getKeyword()=" + getKeyword() + ", getUrl()=" + getUrl()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}

	
	
}
