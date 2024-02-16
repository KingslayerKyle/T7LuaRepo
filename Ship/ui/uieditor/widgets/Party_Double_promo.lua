-- c75fb0515af012441dfe15f1fddb5925
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.DLC_Free_TitleAndText" )

CoD.Party_Double_promo = InheritFrom( LUI.UIElement )
CoD.Party_Double_promo.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Party_Double_promo )
	self.id = "Party_Double_promo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 425 )
	self:setTopBottom( true, false, 0, 125 )
	self.anyChildUsesUpdateState = true
	
	local DLCFreeTitleAndText = CoD.DLC_Free_TitleAndText.new( menu, controller )
	DLCFreeTitleAndText:setLeftRight( true, true, 0, -1 )
	DLCFreeTitleAndText:setTopBottom( true, false, 0, 125 )
	DLCFreeTitleAndText.Title:setText( Engine.Localize( "MPUI_PARTY_DOUBLE_PROMO" ) )
	DLCFreeTitleAndText.Body:setText( Engine.Localize( "MPUI_PARTY_DOUBLE_PROMO_DESC" ) )
	self:addElement( DLCFreeTitleAndText )
	self.DLCFreeTitleAndText = DLCFreeTitleAndText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				DLCFreeTitleAndText:completeAnimation()
				self.DLCFreeTitleAndText:setAlpha( 0 )
				self.clipFinished( DLCFreeTitleAndText, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				DLCFreeTitleAndText:completeAnimation()
				self.DLCFreeTitleAndText:setAlpha( 1 )
				self.clipFinished( DLCFreeTitleAndText, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsDvarValueEqualTo( "ui_partyPromo", "1" )
			end
		}
	} )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.DLCFreeTitleAndText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
