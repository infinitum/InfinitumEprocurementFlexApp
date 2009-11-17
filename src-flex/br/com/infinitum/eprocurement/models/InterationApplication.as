package br.com.infinitum.eprocurement.models
{
	import flash.utils.setInterval;
	
	import mx.controls.DataGrid;
	import mx.core.Application;
	
	public class InteractionApplication
	{
		public static const NotificationError:String = 'error';
		public static const NotificationSuccess:String = 'success';
		public static const NotificationNotice:String = 'notice';
		
		public function NotificationStart(type:String):void
		{
			if(type == 'error')
			{
				Application.application.notificationError.visible = true;
				Application.application.moveIn.end();
				Application.application.moveIn.target = "notificationError"; 
                Application.application.moveIn.play();
                intervalId = setInterval(myRepeatingFunction, intervalDuration,'notificationError');
			}
			
			if(type == 'success')
			{
				Application.application.notificationSuccess.visible = true;
				Application.application.moveIn.end();
				Application.application.moveIn.target = "notificationSuccess"; 
                Application.application.moveIn.play();
                intervalId = setInterval(myRepeatingFunction, intervalDuration,'notificationSuccess');
			}
			
			if(type == 'notice')
			{
				Application.application.notificationNotice.visible = true;
				Application.application.moveIn.end();
				Application.application.moveIn.target = "notificationNotice"; 
                Application.application.moveIn.play();
                intervalId = setInterval(myRepeatingFunction, intervalDuration,'notificationNotice');
			}			
		}
		
		private var intervalDuration:Number = 1000;
        private var intervalId:uint;
        private var counter:uint = 0;
        private var stopCount:uint = 5;

        public function myRepeatingFunction():void {
            counter++;
            if(counter == stopCount) {
                this.clearInterval(intervalId);
                this.NotificationStop(arguments[0]);
            }
        }
		
		private function NotificationStop(notification:String):void
		{
			Application.application.moveOut.end();
			Application.application.moveOut.target = notification; 
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
			oManipulationData = new ManipulationAutenticationData();
			/*if(menuPosition) 
				oManipulationData.GetControleAcesso();
			else 
				Application.application.menuPrincipal.visible = false;*/
		}
		
		// TODO: Applica um fadeIn no login
		public function RemoveTelaLogin(menuPosition:int):void
		{
			this.SetTextCrumb(menuPosition);
			Application.application.telaLogin.visible = false;
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
	}
}