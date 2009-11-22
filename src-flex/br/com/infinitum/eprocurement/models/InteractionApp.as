package br.com.infinitum.eprocurement.models
{
	import flash.utils.clearInterval;
	
	public class InteractionApp
	{
		import flash.utils.setInterval;
		import mx.controls.DataGrid;
		import mx.core.Application;
		
		public const NotificationError:String = 'error';
		public const NotificationSuccess:String = 'success';
		public const NotificationNotice:String = 'notice';
		
		public function NotificationStart(type:String,message:String):void
		{
			Application.application.notificationSuccess.message.text = message;
			Application.application.notificationNotice.message.text = message;
			Application.application.notificationError.message.text = message;
			if(type == 'error')
			{
				Application.application.notificationError.visible = true;
				Application.application.moveIn.end();
				Application.application.moveIn.target = Application.application.notificationError; 
                Application.application.moveIn.play();
                intervalId = setInterval(myRepeatingFunction, intervalDuration,'error');
			}
			
			if(type == 'success')
			{
				Application.application.notificationSuccess.visible = true;
				Application.application.moveIn.end();
				Application.application.moveIn.target = Application.application.notificationSuccess; 
                Application.application.moveIn.play();
                intervalId = setInterval(myRepeatingFunction, intervalDuration,"success");
			}
			
			if(type == 'notice')
			{
				Application.application.notificationNotice.visible = true;
				Application.application.moveIn.end();
				Application.application.moveIn.target = Application.application.notificationNotice; 
                Application.application.moveIn.play();
                intervalId = setInterval(myRepeatingFunction, intervalDuration,'notice');
			}		
		}
		
		private var intervalDuration:Number = 1000;
        private var intervalId:uint;
        private var counter:uint = 0;
        private var stopCount:uint = 5;

        public function myRepeatingFunction():void {
            counter++;
            if(counter == stopCount) {
                clearInterval(intervalId);
                this.NotificationStop(arguments[0]);
            }
        }
		
		private function NotificationStop(notification:*):void
		{
			Application.application.moveOut.end();
			if(notification == 'error') Application.application.moveOut.target = Application.application.notificationError;
			if(notification == 'notice') Application.application.moveOut.target = Application.application.notificationNotice;
			if(notification == 'success') Application.application.moveOut.target = Application.application.notificationSuccess; 
            Application.application.moveOut.play();
		}
		
		// TODO: Seta o texto de posicionamento
		public function SetTextCrumb(numPosition:int):void
		{
			switch(numPosition)
			{
				case 0 : Application.application.appHeader.TxtHeader.text = "Autenticação de Usuários"; break;
				case 1 : Application.application.appHeader.TxtHeader.text = "Página Inicial"; break;
				case 2 : Application.application.appHeader.TxtHeader.text = "Gerenciamento de Cotações"; break;
			}
		}
		
		// TODO: Seleciona uma posição na tela de navegação
		public function NavegaMain(menuPosition:int):void
		{
			this.SetTextCrumb(menuPosition);
			Application.application.main.selectedIndex = menuPosition;
			//oManipulationData = new ManipulationAutenticationData();
			/*if(menuPosition) 
				oManipulationData.GetControleAcesso();
			else 
				Application.application.menuPrincipal.visible = false;*/
		}
		
		// TODO: Applica um fadeIn no login
		public function RemoveTelaLogin(menuPosition:int):void
		{
			this.SetTextCrumb(menuPosition);
			//Application.application.fadeIn.play();
			Application.application.telaLogin.visible = false;
			Application.application.main.visible = true;
		}
		
		// TODO: Seleciona uma posição num DataGrid
		public function NavegationGrid(grid:DataGrid,argDirection:int):void
		{
			if(argDirection == 1)
			{
				grid.scrollToIndex(grid.selectedIndex+1);
				grid.selectedIndex++;
			}
			else
				if(grid.selectedIndex > 0)
				{
					grid.scrollToIndex(grid.selectedIndex-1);
					grid.selectedIndex--
				}
		}
		
		public function InteractionApp()
		{
		}
	}
}