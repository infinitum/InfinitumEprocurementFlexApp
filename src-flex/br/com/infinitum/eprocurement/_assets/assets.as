package br.com.infinitum.eprocurement._assets
{
	import flash.utils.getDefinitionByName;
	[Bindable]
	public class Assets
	{
		[Embed('bg/bg_topo_principal.png')]
		public static const BGTOPO:Class;  
		
		[Embed('topo_principal.png')]
		public static const TOPO:Class;
		
		[Embed('icos/ico_tabbar_principal.png')]
		public static const TABPRINCIPAL:Class;
		
		private static var image : Assets;
		public static function getInstance() : Assets
   		{
   			if ( image == null )          
     		{              
         		image = new Assets();
       		}
      		return image;
       	}  
	}
}