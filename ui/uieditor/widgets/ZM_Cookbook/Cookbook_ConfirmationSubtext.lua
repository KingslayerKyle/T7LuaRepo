-- b39ef1eb1e8878376e2ec6e11c217469
-- This hash is used for caching, delete to decompile the file again

CoD.Cookbook_ConfirmationSubtext = InheritFrom( LUI.UIElement )
CoD.Cookbook_ConfirmationSubtext.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Cookbook_ConfirmationSubtext )
	self.id = "Cookbook_ConfirmationSubtext"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 20 )
	
	local Ready = LUI.UIText.new()
	Ready:setLeftRight( true, false, 0, 200 )
	Ready:setTopBottom( true, false, 1.5, 18.5 )
	Ready:setRGB( 0.04, 0.49, 0 )
	Ready:setText( LocalizeToUpperString( "ZMUI_COOKBOOK_READY_TO_DISTILL_CAPS" ) )
	Ready:setTTF( "fonts/default.ttf" )
	Ready:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Ready:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( Ready )
	self.Ready = Ready
	
	local NotReady = LUI.UIText.new()
	NotReady:setLeftRight( true, false, 0, 200 )
	NotReady:setTopBottom( true, false, 1.5, 18.5 )
	NotReady:setRGB( 0.68, 0, 0.02 )
	NotReady:setAlpha( 0 )
	NotReady:setText( LocalizeToUpperString( "ZMUI_COOKBOOK_NOT_ENOUGH_TO_DISTILL_CAPS" ) )
	NotReady:setTTF( "fonts/default.ttf" )
	NotReady:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	NotReady:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( NotReady )
	self.NotReady = NotReady
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Ready:completeAnimation()
				self.Ready:setAlpha( 0 )
				self.clipFinished( Ready, {} )
				NotReady:completeAnimation()
				self.NotReady:setAlpha( 0 )
				self.NotReady:setText( LocalizeToUpperString( "Not enough to distill" ) )
				self.clipFinished( NotReady, {} )
			end
		},
		Red = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Ready:completeAnimation()
				self.Ready:setAlpha( 0 )
				self.clipFinished( Ready, {} )
				NotReady:completeAnimation()
				self.NotReady:setRGB( 0.93, 0.11, 0.14 )
				self.NotReady:setAlpha( 0.7 )
				self.clipFinished( NotReady, {} )
			end
		},
		Green = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Ready:completeAnimation()
				self.Ready:setAlpha( 0.7 )
				self.clipFinished( Ready, {} )
				NotReady:completeAnimation()
				self.NotReady:setAlpha( 0 )
				self.clipFinished( NotReady, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

