require( "ui.uieditor.widgets.CallingCards.CODE.CallingCards_code_sea_subprop" )

CoD.CallingCards_code_sea_sub = InheritFrom( LUI.UIElement )
CoD.CallingCards_code_sea_sub.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_code_sea_sub )
	self.id = "CallingCards_code_sea_sub"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 512 )
	self:setTopBottom( true, false, 0, 128 )
	self.anyChildUsesUpdateState = true
	
	local CallingCardscodeseasubprop = CoD.CallingCards_code_sea_subprop.new( menu, controller )
	CallingCardscodeseasubprop:setLeftRight( true, false, 200, 236 )
	CallingCardscodeseasubprop:setTopBottom( true, false, 24, 60 )
	self:addElement( CallingCardscodeseasubprop )
	self.CallingCardscodeseasubprop = CallingCardscodeseasubprop
	
	local sub = LUI.UIImage.new()
	sub:setLeftRight( true, false, 0, 512 )
	sub:setTopBottom( true, false, 0, 128 )
	sub:setImage( RegisterImage( "uie_t7_callingcards_sea_sub" ) )
	self:addElement( sub )
	self.sub = sub
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				CallingCardscodeseasubprop:completeAnimation()
				self.CallingCardscodeseasubprop:setAlpha( 0.6 )
				self.clipFinished( CallingCardscodeseasubprop, {} )
				sub:completeAnimation()
				self.sub:setAlpha( 1 )
				self.clipFinished( sub, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardscodeseasubprop:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

