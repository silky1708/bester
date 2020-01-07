; https=//exceljet.net/formula/add-a-line-break-with-a-formula
(set-logic SLIA)
(synth-fun f ((_arg_0 String) (_arg_1 String) (_arg_2 String)) String 
 ( (Start String (ntString)) 
 (ntString String (
	_arg_0 _arg_1 _arg_2
	"" " " "/n"
	(str.++ ntString ntString) 
	(str.replace ntString ntString ntString) 
	(str.at ntString ntInt)
	(int.to.str ntInt)
	(ite ntBool ntString ntString)
	(str.substr ntString ntInt ntInt)
)) 
 (ntInt Int (
	
	1 0 -1
	(+ ntInt ntInt)
	(- ntInt ntInt)
	(str.len ntString)
	(str.to.int ntString)
	(ite ntBool ntInt ntInt)
	(str.indexof ntString ntString ntInt)
)) 
 (ntBool Bool (
	
	true false
	(= ntInt ntInt)
	(str.prefixof ntString ntString)
	(str.suffixof ntString ntString)
	(str.contains ntString ntString)
)) ))
(constraint (= (f "Mary Hannan" "1195 Amethyst Drive" "Lansing, MI 48933") "Mary Hannan/n1195 Amethyst Drive/nLansing, MI 48933"))
(constraint (= (f "Linda Thomas" "2479 North Bend Road" "Allen, KY 41601") "Linda Thomas/n2479 North Bend Road/nAllen, KY 41601"))
(constraint (= (f "Linda Thomason" "2478 North Bend Road" "Allen, KY 41601") "Linda Thomason/n2479 North Bend Road/nAllen, KY 41601"))
(check-synth)
