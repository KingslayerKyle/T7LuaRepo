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

CoD.MissionRecordVault_AccoladesTime = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_AccoladesTime.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_AccoladesTime )
	self.id = "MissionRecordVault_AccoladesTime"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 150 )
	self:setTopBottom( 0, 0, 0, 150 )
	
	local image = LUI.UIImage.new()
	image:setLeftRight( 0, 1, 0, 0 )
	image:setTopBottom( 0, 1, 0, 0 )
	image:setRGB( 1, 0.96, 0 )
	image:setImage( RegisterImage( "uie_t7_menu_cp_vault_timer" ) )
	self:addElement( image )
	self.image = image
	
	local centerText = LUI.UIText.new()
	centerText:setLeftRight( 0, 1, 0, 0 )
	centerText:setTopBottom( 0.5, 0.5, -6, 22 )
	centerText:setRGB( 1, 0.96, 0 )
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
		centerText:completeAnimation()
		image:setRGB( 1, 0.96, 0 )
		centerText:setRGB( 1, 0.96, 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Incomplete = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				image:completeAnimation()
				self.image:setRGB( 1, 1, 1 )
				self.clipFinished( image, {} )
				centerText:completeAnimation()
				self.centerText:setRGB( 1, 1, 1 )
				self.clipFinished( centerText, {} )
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

