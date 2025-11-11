CoD.DLCLabel = InheritFrom( LUI.UIElement )
CoD.DLCLabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DLCLabel )
	self.id = "DLCLabel"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 93 )
	self:setTopBottom( 0, 0, 0, 78 )
	
	local DLCLabelYellowRight = LUI.UIImage.new()
	DLCLabelYellowRight:setLeftRight( 1, 1, -30, 1 )
	DLCLabelYellowRight:setTopBottom( 0, 1, 0, 0 )
	DLCLabelYellowRight:setImage( RegisterImage( "uie_t7_zombie_dlclabel_right" ) )
	self:addElement( DLCLabelYellowRight )
	self.DLCLabelYellowRight = DLCLabelYellowRight
	
	local DLCLabelYellowCenter = LUI.UIImage.new()
	DLCLabelYellowCenter:setLeftRight( 0, 1, 31, -31 )
	DLCLabelYellowCenter:setTopBottom( 0, 1, 0, 0 )
	DLCLabelYellowCenter:setImage( RegisterImage( "uie_t7_zombie_dlclabel_center" ) )
	self:addElement( DLCLabelYellowCenter )
	self.DLCLabelYellowCenter = DLCLabelYellowCenter
	
	local DLCLabelYellowLeft = LUI.UIImage.new()
	DLCLabelYellowLeft:setLeftRight( 0, 0, 0, 31 )
	DLCLabelYellowLeft:setTopBottom( 0, 1, 0, 0 )
	DLCLabelYellowLeft:setImage( RegisterImage( "uie_t7_zombie_dlclabel_left" ) )
	self:addElement( DLCLabelYellowLeft )
	self.DLCLabelYellowLeft = DLCLabelYellowLeft
	
	local DLCLabelGreyRight = LUI.UIImage.new()
	DLCLabelGreyRight:setLeftRight( 1, 1, -30, 1 )
	DLCLabelGreyRight:setTopBottom( 0, 1, 0, 0 )
	DLCLabelGreyRight:setAlpha( 0 )
	DLCLabelGreyRight:setImage( RegisterImage( "uie_t7_zombie_dlclabel_right_greyscale" ) )
	self:addElement( DLCLabelGreyRight )
	self.DLCLabelGreyRight = DLCLabelGreyRight
	
	local DLCLabelGreyCenter = LUI.UIImage.new()
	DLCLabelGreyCenter:setLeftRight( 0, 1, 31, -31 )
	DLCLabelGreyCenter:setTopBottom( 0, 1, 0, 0 )
	DLCLabelGreyCenter:setAlpha( 0 )
	DLCLabelGreyCenter:setImage( RegisterImage( "uie_t7_zombie_dlclabel_center_greyscale" ) )
	self:addElement( DLCLabelGreyCenter )
	self.DLCLabelGreyCenter = DLCLabelGreyCenter
	
	local DLCLabelGreyLeft = LUI.UIImage.new()
	DLCLabelGreyLeft:setLeftRight( 0, 0, 0, 31 )
	DLCLabelGreyLeft:setTopBottom( 0, 1, 0, 0 )
	DLCLabelGreyLeft:setAlpha( 0 )
	DLCLabelGreyLeft:setImage( RegisterImage( "uie_t7_zombie_dlclabel_left_greyscale" ) )
	self:addElement( DLCLabelGreyLeft )
	self.DLCLabelGreyLeft = DLCLabelGreyLeft
	
	local Text = LUI.UITightText.new()
	Text:setLeftRight( 1, 1, -101, -24 )
	Text:setTopBottom( 0.5, 0.5, -17, 21 )
	Text:setRGB( 0, 0, 0 )
	Text:setTTF( "fonts/escom.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( Text, "setText", function ( element, text )
		ScaleWidgetToLabelRightAligned( self, element, 0 )
	end )
	self:addElement( Text )
	self.Text = Text
	
	self.Text:linkToElementModel( self, "dlcIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Text:setText( Engine.Localize( GetBGBDLCStringFromIndex( "ZMUI_DLC_NUM", modelValue ) ) )
		end
	end )
	self.resetProperties = function ()
		DLCLabelYellowLeft:completeAnimation()
		DLCLabelYellowCenter:completeAnimation()
		DLCLabelGreyLeft:completeAnimation()
		DLCLabelGreyCenter:completeAnimation()
		DLCLabelGreyRight:completeAnimation()
		DLCLabelYellowRight:completeAnimation()
		Text:completeAnimation()
		DLCLabelYellowLeft:setAlpha( 1 )
		DLCLabelYellowCenter:setAlpha( 1 )
		DLCLabelGreyLeft:setAlpha( 0 )
		DLCLabelGreyCenter:setAlpha( 0 )
		DLCLabelGreyRight:setAlpha( 0 )
		DLCLabelYellowRight:setAlpha( 1 )
		Text:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Greyscale = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				DLCLabelYellowRight:completeAnimation()
				self.DLCLabelYellowRight:setAlpha( 0 )
				self.clipFinished( DLCLabelYellowRight, {} )
				DLCLabelYellowCenter:completeAnimation()
				self.DLCLabelYellowCenter:setAlpha( 0 )
				self.clipFinished( DLCLabelYellowCenter, {} )
				DLCLabelYellowLeft:completeAnimation()
				self.DLCLabelYellowLeft:setAlpha( 0 )
				self.clipFinished( DLCLabelYellowLeft, {} )
				DLCLabelGreyRight:completeAnimation()
				self.DLCLabelGreyRight:setAlpha( 1 )
				self.clipFinished( DLCLabelGreyRight, {} )
				DLCLabelGreyCenter:completeAnimation()
				self.DLCLabelGreyCenter:setAlpha( 1 )
				self.clipFinished( DLCLabelGreyCenter, {} )
				DLCLabelGreyLeft:completeAnimation()
				self.DLCLabelGreyLeft:setAlpha( 1 )
				self.clipFinished( DLCLabelGreyLeft, {} )
			end
		},
		HasDLC = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				DLCLabelYellowRight:completeAnimation()
				self.DLCLabelYellowRight:setAlpha( 0 )
				self.clipFinished( DLCLabelYellowRight, {} )
				DLCLabelYellowCenter:completeAnimation()
				self.DLCLabelYellowCenter:setAlpha( 0 )
				self.clipFinished( DLCLabelYellowCenter, {} )
				DLCLabelYellowLeft:completeAnimation()
				self.DLCLabelYellowLeft:setAlpha( 0 )
				self.clipFinished( DLCLabelYellowLeft, {} )
				Text:completeAnimation()
				self.Text:setAlpha( 0 )
				self.clipFinished( Text, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Greyscale",
			condition = function ( menu, element, event )
				return IsCACItemFromDLC( menu, element, controller ) and not IsCACItemDLCPurchased( menu, element, controller )
			end
		},
		{
			stateName = "HasDLC",
			condition = function ( menu, element, event )
				return IsCACItemDLCPurchased( menu, element, controller ) and IsCACItemFromDLC( menu, element, controller )
			end
		},
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	self:linkToElementModel( self, "itemIndex", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Text:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

