 class  AppExceptions implements Exception

 {
    final  _message;

    final _prefix;


    AppExceptions([this._message,this._prefix]);


    String  toString()
    {

      return'$_prefix$_message';

    }

 }


 class InternetException extends AppExceptions
 {
   InternetException([String ? message]):

         super(message,'No Internet Connection');


 }

 class RequestTimeOut extends AppExceptions
 {
   RequestTimeOut([String ? message]):super(message,'');

 }
 class InvalidUrl extends AppExceptions
 {

   InvalidUrl([String ? message]):super(message,'Invalid Url');


 }





 class FetchDataException extends AppExceptions
 {
   FetchDataException([String ? message]):super(message,'some Url');

 }






 class SomeException extends AppExceptions
 {
   SomeException([String ? message]):super(message,'some Url');

 }
