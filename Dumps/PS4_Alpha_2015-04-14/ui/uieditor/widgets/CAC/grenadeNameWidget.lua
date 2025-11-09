local PostLoadFunc = function ( self, controller )
	self.updateState = function ( self, event )
		self.super:updateState( event )
		local textWidgetLeft, textWidgetTop, textWidgetRight, textWidgetBottom = self.grenadeName:getLocalRect()
		local textLeft, textTop, textRight, textBottom = GetTextDimensions( self.grenadeName:getText(), CoD.fonts.ExtraSmall, CoD.textSize.ExtraSmall )
		self.timesTwo:setLeftRight( true, false, textWidgetLeft + textRight + 8, textWidgetLeft + textRight + 300 )
	end
	
end

CoD.grenadeNameWidget = InheritFrom( LUI.UIElement )
CoD.grenadeNameWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.grenadeNameWidget )
	self.id = "grenadeNameWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 25 )
	
	local grenadeName = LUI.UITightText.new()
	grenadeName:setLeftRight( true, false, 0, 62 )
	grenadeName:setTopBottom( false, true, -20, 0 )
	grenadeName:setRGB( 0.9, 0.9, 0.9 )
	grenadeName:setText( Engine.Localize( "WEAPON_FRAGGRENADE" ) )
	grenadeName:setTTF( "fonts/default.ttf" )
	self:addElement( grenadeName )
	self.grenadeName = grenadeName
	
	local timesTwo = LUI.UITightText.new()
	timesTwo:setLeftRight( false, true, -16, 0 )
	timesTwo:setTopBottom( true, false, 5, 25 )
	timesTwo:setRGB( 1, 1, 1 )
	timesTwo:setAlpha( 0 )
	timesTwo:setText( Engine.Localize( "MP_X2" ) )
	timesTwo:setTTF( "fonts/default.ttf" )
	self:addElement( timesTwo )
	self.timesTwo = timesTwo
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				timesTwo:completeAnimation()
				self.timesTwo:setAlpha( 0 )
				self.clipFinished( timesTwo, {} )
			end
		},
		TimesTwoEquipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				timesTwo:completeAnimation()
				self.timesTwo:setAlpha( 1 )
				self.clipFinished( timesTwo, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

