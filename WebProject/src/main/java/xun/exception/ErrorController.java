package xun.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class ErrorController {
	
    @ExceptionHandler(NoHandlerFoundException.class)
    public String handle(Exception ex) {
    	return "e404";
    }

//  @ExceptionHandler(Throwable.class)
//  public String handleException(final Exception e) {
//      return "e500";
//  }
    
//    @ExceptionHandler(RuntimeException.class)
//    public String handleException(final Exception e) {
//        return "e500";
//    }
    
//    @RequestMapping(value = {"/404"}, method = RequestMethod.GET)
//    public String NotFoudPage() {
//		return "e404";
//	}
}
