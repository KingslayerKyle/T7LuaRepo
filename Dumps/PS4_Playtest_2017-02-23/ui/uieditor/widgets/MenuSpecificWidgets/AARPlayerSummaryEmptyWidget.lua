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
	self:setLeftRight( 0, 0, 0, 360 )
	self:setTopBottom( 0, 0, 0, 600 )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( 0, 1, 0, 0 )
	background:setTopBottom( 0, 1, 0, 0 )
	background:setRGB( 0.51, 0.51, 0.51 )
	self:addElement( background )
	self.background = background
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( 0, 1, -3, 3 )
	border:setTopBottom( 0, 1, -3, 3 )
	border:setRGB( 0, 0, 0 )
	self:addElement( border )
	self.border = border
	
	local emptyPlayerBg = LUI.UIImage.new()
	emptyPlayerBg:setLeftRight( 0, 1, 0, 0 )
	emptyPlayerBg:setTopBottom( 0, 0, 0, 210 )
	emptyPlayerBg:setRGB( 0, 0, 0 )
	self:addElement( emptyPlayerBg )
	self.emptyPlayerBg = emptyPlayerBg
	
	local emptyPlayerLabel = LUI.UITightText.new()
	emptyPlayerLabel:setLeftRight( 0, 1, 134, -134 )
	emptyPlayerLabel:setTopBottom( 0, 0, 86, 124 )
	emptyPlayerLabel:setRGB( 0.44, 0.44, 0.44 )
	emptyPlayerLabel:setText( Engine.Localize( "XBOXLIVE_PLAYER1" ) )
	emptyPlayerLabel:setTTF( "fonts/default.ttf" )
	self:addElement( emptyPlayerLabel )
	self.emptyPlayerLabel = emptyPlayerLabel
	
	self.resetProperties = function ()
		emptyPlayerLabel:completeAnimation()
		emptyPlayerBg:completeAnimation()
		border:completeAnimation()
		background:completeAnimation()
		emptyPlayerLabel:setAlpha( 1 )
		emptyPlayerBg:setAlpha( 1 )
		border:setAlpha( 1 )
		background:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.border:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

