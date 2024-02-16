-- 997d1540b53a6dac889042fab6671ba2
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = DataSources.HUDItems.getModel( controller )
	if f1_local0 then
		Engine.SetModelValue( Engine.CreateModel( f1_local0, "tabletLocationSelectorText" ), "" )
	end
end

CoD.TabletLocationSelector_HintText = InheritFrom( LUI.UIElement )
CoD.TabletLocationSelector_HintText.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.TabletLocationSelector_HintText )
	self.id = "TabletLocationSelector_HintText"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 720 )
	self:setTopBottom( true, false, 0, 24 )
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( true, true, 0, 0 )
	FEButtonPanel0:setTopBottom( true, true, 0, 0 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0.85 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local CursorHintText = LUI.UIText.new()
	CursorHintText:setLeftRight( false, false, -360, 360 )
	CursorHintText:setTopBottom( true, false, 2, 22 )
	CursorHintText:setTTF( "fonts/escom.ttf" )
	CursorHintText:setLetterSpacing( 0.5 )
	CursorHintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	CursorHintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	CursorHintText:subscribeToGlobalModel( controller, "HUDItems", "tabletLocationSelectorText", function ( model )
		local tabletLocationSelectorText = Engine.GetModelValue( model )
		if tabletLocationSelectorText then
			CursorHintText:setText( Engine.Localize( tabletLocationSelectorText ) )
		end
	end )

	LUI.OverrideFunction_CallOriginalFirst( CursorHintText, "setText", function ( element, controller )
		ScaleWidgetToLabelCentered( self, element, 5 )
	end )
	self:addElement( CursorHintText )
	self.CursorHintText = CursorHintText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setLeftRight( true, true, 0, 0 )
				self.FEButtonPanel0:setTopBottom( true, true, 0, 0 )
				self.clipFinished( FEButtonPanel0, {} )

				CursorHintText:completeAnimation()
				self.CursorHintText:setLeftRight( false, false, -360, 360 )
				self.CursorHintText:setTopBottom( true, false, 2, 22 )
				self.clipFinished( CursorHintText, {} )
			end
		},
		Splitscreen = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				FEButtonPanel0:completeAnimation()
				self.FEButtonPanel0:setLeftRight( true, true, 0, 0 )
				self.FEButtonPanel0:setTopBottom( true, true, -5, 5 )
				self.clipFinished( FEButtonPanel0, {} )

				CursorHintText:completeAnimation()
				self.CursorHintText:setLeftRight( false, false, -360, 360 )
				self.CursorHintText:setTopBottom( true, false, -3, 27 )
				self.clipFinished( CursorHintText, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Splitscreen",
			condition = function ( menu, element, event )
				return IsSplitscreenAndInGame( controller )
			end
		}
	} )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanel0:close()
		element.CursorHintText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
