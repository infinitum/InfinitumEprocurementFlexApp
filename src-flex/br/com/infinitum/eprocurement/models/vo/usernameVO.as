package br.com.infinitum.eprocurement.models.vo
{
	import util.IComparable;
	[RemoteClass(alias="vo.usernameVO")]
	
	public class usernameVO implements IComparable
	{
		public function get identifier():String
		{
			return String( id );
		}
		
		[Bindable] public var id:int;
		[Bindable] public var username:String;
        [Bindable] public var senha:String;
        [Bindable] public var usuario:int;
        [Bindable] public var roles = '0';
	}
}