package br.com.infinitum.eprocurement.views
{
	import br.com.infinitum.eprocurement.commands.AutenticationCommands;
	import br.com.infinitum.eprocurement.models.InteractionApp;
	import br.com.infinitum.eprocurement.models.vo.autenticacaoVO;
	
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	import mx.containers.Canvas;
	import mx.controls.Button;
	import mx.controls.ComboBox;
	import mx.controls.TextInput;
	import mx.effects.*;
	
	
	
	public class LoginContainer extends Canvas
	{
		public var comboModo:ComboBox;
		public var inputContainerUsername:TextInput;
		public var inputContainerPassword:TextInput;
		public var buttonContainer:Button;
		public var objInteration:InteractionApp = new InteractionApp();
		//public var objManipulateData:ManipulationAutenticationData;
		
		[Bindable] private var arrProvider:ArrayCollection;
		[Bindable] private var dpModos:ArrayCollection;
		[Bindable] private var arrModos:Array = new Array();
		[Bindable] private var autenticaCommand:AutenticationCommands;
		
		[Embed(source="br/com/infinitum/eprocurement/_assets/bts/btEntrarOn.jpg")] private var ImageLoginOn:Class;
		[Embed(source="br/com/infinitum/eprocurement/_assets/bts/btEntrarOver.jpg")] private var ImageLoginOver:Class;
		
		public function LoginContainer()
		{
			super();
			//addChild(SetComboModo());
			addChild(SetUsername());
			addChild(SetPassword());
			addChild(SetButton());
		}
		
		// TODO: cria o combo box cbModo
		/*public function SetComboModo():ComboBox
		{
			arrModos[0] = "Funcionário";
			arrModos[1] = "Fornecedor";
			dpModos = new ArrayCollection(arrModos);
			//login.comboModo.dataProvider = dpModos;
				
			comboModo = new ComboBox();
			comboModo.id = "cbModo";
			comboModo.x = 251;
			comboModo.y = 70;
			comboModo.width = 187;
			comboModo.dataProvider = dpModos;
			
			return comboModo;
		}*/
		
		// TODO: Cria o input username
		public function SetUsername():TextInput
		{
			inputContainerUsername = new TextInput();
			inputContainerUsername.id = "txtUsername";
			inputContainerUsername.toolTip = "Digite seu username"; 
			inputContainerUsername.width = 187; 
			inputContainerUsername.height = 20;  
			inputContainerUsername.x = 251; 
			inputContainerUsername.y = 100;
			
			return inputContainerUsername;
		}
		
		// TODO: Cria o input password
		public function SetPassword():TextInput
		{
			inputContainerPassword = new TextInput();
			inputContainerPassword.id = "txtPassword";
			inputContainerPassword.toolTip = "Digite sua senha"; 
			inputContainerPassword.displayAsPassword = true;
			inputContainerPassword.width = 187; 
			inputContainerPassword.height = 20;  
			inputContainerPassword.x = 251; 
			inputContainerPassword.y = 127;
			
			return inputContainerPassword;
		}
		
		// TODO: Cria o botão
		private function SetButton():Button
		{
			buttonContainer = new Button();
			buttonContainer.id = "btLogin";
			buttonContainer.toolTip = "Clique para logar-se como funcionário"; 
			buttonContainer.setStyle("icon",ImageLoginOn);
			buttonContainer.setStyle("overIcon",ImageLoginOver); 
			buttonContainer.width = 60; 
			buttonContainer.height = 17; 
			buttonContainer.y = 153; 
			buttonContainer.x = 378;
			buttonContainer.addEventListener(MouseEvent.CLICK,AutenticaUsuarioClickHandler);
			 
			return buttonContainer;
		}
		
		
		// TODO: Inicia o processo de login
		private function AutenticaUsuarioClickHandler(e:MouseEvent):void
		{
			if(inputContainerUsername.text != "" && inputContainerPassword.text != "")
			{		
				var dados:autenticacaoVO = new autenticacaoVO();
				dados.username = inputContainerUsername.text;
				dados.password = inputContainerPassword.text;
				
				autenticaCommand = new AutenticationCommands();
				autenticaCommand.doAutentication(dados);	
			}
			else objInteration.NotificationStart(objInteration.NotificationError,"Atenção\n\nPreencha os campos de login e senha corretamente e tente novamente!");
		}

	}
}