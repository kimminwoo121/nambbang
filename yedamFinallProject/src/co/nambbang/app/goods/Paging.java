package co.nambbang.app.goods;

public class Paging {
    private final static int pageCount = 10;
    private int blockStartNum = 0;
    private int blockLastNum = 0;
    private int lastPageNum = 0;
    private int curPageNum = 0;
    private int countPerPage = 10;
    private int first = 0;
    private int last = 0;

    public int getBlockStartNum() {
        return blockStartNum;
    }
    public void setBlockStartNum(int blockStartNum) {
        this.blockStartNum = blockStartNum;
    }
    public int getBlockLastNum() {
        return blockLastNum;
    }
    public void setBlockLastNum(int blockLastNum) {
        this.blockLastNum = blockLastNum;
    }
    public int getLastPageNum() {
        return lastPageNum;
    }
    public void setLastPageNum(int lastPageNum) {
        this.lastPageNum = lastPageNum;
    }
    public int getCurPageNum() {
		return curPageNum;
	}
	public void setCurPageNum(int curPageNum) {
		this.curPageNum = curPageNum;
	}
	public int getCountPerPage() {
		return countPerPage;
	}
	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}
	public int getFirst() {
		return first;
	}
	public void setFirst(int first) {
		this.first = first;
	}
	public int getLast() {
		return last;
	}
	public void setLast(int last) {
		this.last = last;
	}
	// block을 생성
    // 현재 페이지가 속한 block의 시작 번호, 끝 번호를 계산
    public void makeBlock(int curPage){
        int blockNum = 0;
        this.curPageNum = curPage;
        blockNum = (int)Math.floor((curPage-1)/ pageCount);
        blockStartNum = (pageCount * blockNum) + 1;
        blockLastNum = blockStartNum + (pageCount-1);
        first = (curPageNum-1)*countPerPage+1;
        last = first+countPerPage-1;
    }

    // 총 페이지의 마지막 번호
    public void makeLastPageNum(int total) {
        if( total % pageCount == 0 ) {
            lastPageNum = (int)Math.floor(total/pageCount);
        }
        else {
            lastPageNum = (int)Math.floor(total/pageCount) + 1;
        }
    }
    
    //페이징출력
    public String printPaging(String fnName) {
    	StringBuffer sb = new StringBuffer();
    	sb.append("<ul class='pagination justify-content-center'>");
    	if(getCurPageNum() > getCountPerPage()){
    		sb.append("<li class='page-item'><a href='#' onclick='"+fnName+"(\""+ (getBlockStartNum() - 1) +"\");' class='page-link'>Previous</a></li>");
    	}
    	for(int i=getBlockStartNum(); i<=getBlockLastNum(); i++){
    		if(i > getLastPageNum()){
    			//sb.append("<li class='page-item'><a class='page-link'>" + i + "</a></li>");
    		}
    		else if(i == getCurPageNum()){
    			sb.append("<li class='page-item active'><a class='page-link'>" + i + "</a></li>");
    		}
    		else{
    			sb.append("<li class='page-item'><a href='#' onclick='"+fnName+"(\""+ i +"\");' class='page-link'>" + i + "</a></li>");
    		}
    	}
    	if(getLastPageNum() > getBlockLastNum()){
    		sb.append("<li class='page-item'><a href='#' onclick='"+fnName+"(\""+ (getBlockLastNum() + 1) +"\");' class='page-link'>next</a></li>");
    	}
    	sb.append("</ul>");
    	return sb.toString();
    }
}