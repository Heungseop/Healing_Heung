package exception;

public class AlreadyExistRelationException extends Exception {

	public AlreadyExistRelationException(){
		super("이미 등록된 그룹핑. ");
	}

}
