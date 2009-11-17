package br.com.infinitum.eprocurement.models.vo
{
	import util.IComparable;
	[RemoteClass(alias="vo.autenticacaoVO")]
	
	public class autenticacaoVO implements IComparable
	{
		public function get identifier():String
		{
			return String( id );
		}
		
		[Bindable] public var id:int;
		[Bindable] public var boolLogin:Boolean;
		[Bindable] public var boolAcesso:Boolean;
		[Bindable] public var username:String;
		[Bindable] public var password:String;
        [Bindable] public var nome:String;
        [Bindable] public var usuario:int;
        [Bindable] public var senha:String;
        [Bindable] public var roles:String = '0';
        [Bindable] public var idtipo:int;
        [Bindable] public var tipo:String;
	}
}