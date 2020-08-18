function checkAddProduct() {
		
		var form = document.newProduct;
			var productId = form.productId;
			var pname = form.pname;
			var unitPrice = form.unitPrice;
			var description = form.description;
			var manufacturer = form.manufacturer;
			var category = form.category;
			var unitsInStock = form.unitsInStock;
			var condition = form.condition;
		
		var regExpId = /^P\d{4,11}$/;
		var regExpPrice = /^\d+(?:[.]?[\d]?[\d])?$/;
		
		// 상품 아이디 
		if(!regExpCheck(regExpId,productId,"[상품코드]\nP와 숫자를 조합하여 5~12자까지 입력하세요\n첫 글자는 반드시 P로 시작하세요.")) {
			return false;  
		}
		
		// 상품명
		if(pname.value.length < 4 || pname.value.length > 12) {
			alert("[상품명]\n최소 4자에서 최대 12자까지 입력하세요.");
			pname.select();
			return false;
		}
		
		// 상품 가격
		if(unitPrice.value.length == 0 || isNaN(unitPrice.value)){
			alert("[가격]\n숫자만 입력하세요");
			unitPrice.select();
			return false;
		}
		if(unitPrice.value < 0) {
			alert("[가격]\n음수는 입력할 수 없습니다.");
			unitPrice.select();
			return false;
		}else if(!regExpCheck(regExpPrice,unitPrice,"[가격]\n소수점 둘째 자리까지만 입력하세요")){
			return false;
		}

		// 재고 수
		if(unitsInStock.value.length == 0 || isNaN(unitsInStock.value)) {
			alert("[재고 수]\n숫자만 입력하세요.");
			unitsInStock.select();
			return false;
		}
		
		function regExpCheck(regExp,e,msg){
			if(regExp.test(e.value)){
				return true;
			}
			alert(msg);
			e.focus();
			return false;
		}

		form.submit();
	}