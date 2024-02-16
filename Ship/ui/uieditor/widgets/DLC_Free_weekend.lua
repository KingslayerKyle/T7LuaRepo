-- 5499b0f1a0488c00f222a9c682b74fe5
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.DLC_Free_TitleAndText" )

CoD.DLC_Free_weekend = InheritFrom( LUI.UIElement )
CoD.DLC_Free_weekend.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.DLC_Free_weekend )
	self.id = "DLC_Free_weekend"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 424 )
	self:setTopBottom( true, false, 0, 182 )
	self.anyChildUsesUpdateState = true
	
	local DLCFreeTitleAndText = CoD.DLC_Free_TitleAndText.new( menu, controller )
	DLCFreeTitleAndText:setLeftRight( true, true, 0, 0 )
	DLCFreeTitleAndText:setTopBottom( true, false, 73, 144 )
	DLCFreeTitleAndText.Title:setText( Engine.Localize( "MENU_DLC1_TRY_AWAKENING_FREE" ) )
	DLCFreeTitleAndText.Body:setText( Engine.Localize( "MENU_DLC1_TRY_AWAKENING_FREE_DESC" ) )
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
				return IsDvarValueEqualTo( "ui_freeDLC1", "1" ) and ShouldShowDLCWidget( controller, "mp_rise" )
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
