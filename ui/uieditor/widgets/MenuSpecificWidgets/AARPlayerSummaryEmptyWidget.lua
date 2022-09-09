-- ab1906c2579f32fe716477a3aa84efdd
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Border" )

CoD.AARPlayerSummaryEmptyWidget = InheritFrom( LUI.UIElement )
CoD.AARPlayerSummaryEmptyWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AARPlayerSummaryEmptyWidget )
	self.id = "AARPlayerSummaryEmptyWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 240 )
	self:setTopBottom( true, false, 0, 400 )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0.51, 0.51, 0.51 )
	self:addElement( background )
	self.background = background
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( true, true, -2, 2 )
	border:setTopBottom( true, true, -2, 2 )
	border:setRGB( 0, 0, 0 )
	self:addElement( border )
	self.border = border
	
	local emptyPlayerBg = LUI.UIImage.new()
	emptyPlayerBg:setLeftRight( true, true, 0, 0 )
	emptyPlayerBg:setTopBottom( true, false, 0, 140 )
	emptyPlayerBg:setRGB( 0, 0, 0 )
	self:addElement( emptyPlayerBg )
	self.emptyPlayerBg = emptyPlayerBg
	
	local emptyPlayerLabel = LUI.UITightText.new()
	emptyPlayerLabel:setLeftRight( true, true, 89, -89 )
	emptyPlayerLabel:setTopBottom( true, false, 57.5, 82.5 )
	emptyPlayerLabel:setRGB( 0.44, 0.44, 0.44 )
	emptyPlayerLabel:setText( Engine.Localize( "XBOXLIVE_PLAYER1" ) )
	emptyPlayerLabel:setTTF( "fonts/default.ttf" )
	self:addElement( emptyPlayerLabel )
	self.emptyPlayerLabel = emptyPlayerLabel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				background:completeAnimation()
				self.background:setAlpha( 0 )
				self.clipFinished( background, {} )

				border:completeAnimation()
				self.border:setAlpha( 0 )
				self.clipFinished( border, {} )

				emptyPlayerBg:completeAnimation()
				self.emptyPlayerBg:setAlpha( 0 )
				self.clipFinished( emptyPlayerBg, {} )

				emptyPlayerLabel:completeAnimation()
				self.emptyPlayerLabel:setAlpha( 0 )
				self.clipFinished( emptyPlayerLabel, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				background:completeAnimation()
				self.background:setAlpha( 1 )
				self.clipFinished( background, {} )

				border:completeAnimation()
				self.border:setRGB( 0, 0, 0 )
				self.clipFinished( border, {} )

				emptyPlayerBg:completeAnimation()
				self.emptyPlayerBg:setAlpha( 1 )
				self.clipFinished( emptyPlayerBg, {} )

				emptyPlayerLabel:completeAnimation()
				self.emptyPlayerLabel:setAlpha( 1 )
				self.clipFinished( emptyPlayerLabel, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.border:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
