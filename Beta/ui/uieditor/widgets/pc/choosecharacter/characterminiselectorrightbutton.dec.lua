require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

local PCSpecific = function ( self, controller )
	self:setHandleMouse( true )
	self:registerEventHandler( "button_action", function ( self, controller )
		self:dispatchEventToParent( {
			name = "mini_selector_right",
			controller = controller
		} )
	end )
end

local PostLoadFunc = function ( self, controller )
	if CoD.isPC then
		PCSpecific( self, controller )
	end
end

CoD.CharacterMiniSelectorRightButton = InheritFrom( LUI.UIElement )
CoD.CharacterMiniSelectorRightButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CharacterMiniSelectorRightButton )
	self.id = "CharacterMiniSelectorRightButton"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 30 )
	self:setTopBottom( true, false, 0, 30 )
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( true, true, 0, 0 )
	FETitleNumBrdr0:setTopBottom( true, true, 0, 0 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local arrowButton = LUI.UIImage.new()
	arrowButton:setLeftRight( true, true, 0, 0 )
	arrowButton:setTopBottom( true, true, 0, 0 )
	arrowButton:setZRot( 180 )
	arrowButton:setScale( 0.7 )
	arrowButton:setImage( RegisterImage( "uie_characterminiselectorarrow" ) )
	self:addElement( arrowButton )
	self.arrowButton = arrowButton
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				FETitleNumBrdr0:completeAnimation()
				self.FETitleNumBrdr0:setRGB( 1, 1, 1 )
				self.clipFinished( FETitleNumBrdr0, {} )
				arrowButton:completeAnimation()
				self.arrowButton:setRGB( 1, 1, 1 )
				self.clipFinished( arrowButton, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 2 )
				FETitleNumBrdr0:completeAnimation()
				self.FETitleNumBrdr0:setRGB( 1, 1, 1 )
				self.clipFinished( FETitleNumBrdr0, {} )
				arrowButton:completeAnimation()
				self.arrowButton:setRGB( 1, 0.45, 0 )
				self.clipFinished( arrowButton, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FETitleNumBrdr0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

