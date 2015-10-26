package exception;

public class AlreadyExistLikeException extends Exception {
	
	public AlreadyExistLikeException(){
		super("이미 추천을 하셨습니다. ");
	}

}
