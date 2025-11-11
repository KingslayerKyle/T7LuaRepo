local PostLoadFunc = function ( self )
	local ta, ba, t, b = self.centerText:getLocalTopBottom()
	if ta == 0.5 and ba == 0.5 then
		local _, _, st, sb = self:getLocalTopBottom()
		local widgetHeight = sb - st
		local textHeightPx = b - t
		local textHeightPct = textHeightPx / widgetHeight
		local realMidPoint = (b + t) / 2 - 0.2 * textHeightPx
		self.centerText:setTopBottom( 0.5 - textHeightPct * 0.4, 0.5 + textHeightPct * 0.6, realMidPoint, realMidPoint )
	end
end

CoD.MissionRecordVault_AccoladesKills = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_AccoladesKills.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_AccoladesKills )
	self.id = "MissionRecordVault_AccoladesKills"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 150 )
	self:setTopBottom( 0, 0, 0, 150 )
	
	local image = LUI.UIImage.new()
	image:setLeftRight( 0, 1, 0, 0 )
	image:setTopBottom( 0, 1, 0, 0 )
	image:setRGB( 1, 0.98, 0.59 )
	image:setImage( RegisterImage( "uie_kill" ) )
	self:addElement( image )
	self.image = image
	
	local centerText = LUI.UIText.new()
	centerText:setLeftRight( 0, 1, 59, -53 )
	centerText:setTopBottom( 0.5, 0.5, -49, -4 )
	centerText:setRGB( 0, 0, 0 )
	centerText:setAlpha( 0 )
	centerText:setTTF( "fonts/escom.ttf" )
	centerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	centerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	centerText:linkToElementModel( self, "centerText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			centerText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( centerText )
	self.centerText = centerText
	
	self.resetProperties = function ()
		image:completeAnimation()
		image:setRGB( 1, 0.98, 0.59 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				image:completeAnimation()
				self.image:setRGB( 1, 0.96, 0 )
				self.clipFinished( image, {} )
			end
		},
		Incomplete = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				image:completeAnimation()
				self.image:setRGB( 1, 1, 1 )
				self.clipFinished( image, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Incomplete",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "completed" )
			end
		}
	} )
	self:linkToElementModel( self, "completed", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "completed"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.centerText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

