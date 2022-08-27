-- 3cdfef49e639363512ea95f4cf3c9d4a
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 62 )
	self:setTopBottom( true, false, 0, 52 )
	
	local DLCLabelYellowRight = LUI.UIImage.new()
	DLCLabelYellowRight:setLeftRight( false, true, -20.4, 0.4 )
	DLCLabelYellowRight:setTopBottom( true, true, 0, 0 )
	DLCLabelYellowRight:setImage( RegisterImage( "uie_t7_zombie_dlclabel_right" ) )
	self:addElement( DLCLabelYellowRight )
	self.DLCLabelYellowRight = DLCLabelYellowRight
	
	local DLCLabelYellowCenter = LUI.UIImage.new()
	DLCLabelYellowCenter:setLeftRight( true, true, 20.8, -20.4 )
	DLCLabelYellowCenter:setTopBottom( true, true, 0, 0 )
	DLCLabelYellowCenter:setImage( RegisterImage( "uie_t7_zombie_dlclabel_center" ) )
	self:addElement( DLCLabelYellowCenter )
	self.DLCLabelYellowCenter = DLCLabelYellowCenter
	
	local DLCLabelYellowLeft = LUI.UIImage.new()
	DLCLabelYellowLeft:setLeftRight( true, false, 0, 20.8 )
	DLCLabelYellowLeft:setTopBottom( true, true, 0, 0 )
	DLCLabelYellowLeft:setImage( RegisterImage( "uie_t7_zombie_dlclabel_left" ) )
	self:addElement( DLCLabelYellowLeft )
	self.DLCLabelYellowLeft = DLCLabelYellowLeft
	
	local DLCLabelGreyRight = LUI.UIImage.new()
	DLCLabelGreyRight:setLeftRight( false, true, -20.4, 0.4 )
	DLCLabelGreyRight:setTopBottom( true, true, 0, 0 )
	DLCLabelGreyRight:setAlpha( 0 )
	DLCLabelGreyRight:setImage( RegisterImage( "uie_t7_zombie_dlclabel_right_greyscale" ) )
	self:addElement( DLCLabelGreyRight )
	self.DLCLabelGreyRight = DLCLabelGreyRight
	
	local DLCLabelGreyCenter = LUI.UIImage.new()
	DLCLabelGreyCenter:setLeftRight( true, true, 20.8, -20.4 )
	DLCLabelGreyCenter:setTopBottom( true, true, 0, 0 )
	DLCLabelGreyCenter:setAlpha( 0 )
	DLCLabelGreyCenter:setImage( RegisterImage( "uie_t7_zombie_dlclabel_center_greyscale" ) )
	self:addElement( DLCLabelGreyCenter )
	self.DLCLabelGreyCenter = DLCLabelGreyCenter
	
	local DLCLabelGreyLeft = LUI.UIImage.new()
	DLCLabelGreyLeft:setLeftRight( true, false, 0, 20.8 )
	DLCLabelGreyLeft:setTopBottom( true, true, 0, 0 )
	DLCLabelGreyLeft:setAlpha( 0 )
	DLCLabelGreyLeft:setImage( RegisterImage( "uie_t7_zombie_dlclabel_left_greyscale" ) )
	self:addElement( DLCLabelGreyLeft )
	self.DLCLabelGreyLeft = DLCLabelGreyLeft
	
	local Text = LUI.UITightText.new()
	Text:setLeftRight( false, true, -67.6, -16 )
	Text:setTopBottom( false, false, -11.18, 13.82 )
	Text:setRGB( 0, 0, 0 )
	Text:setTTF( "fonts/escom.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( Text, "setText", function ( element, controller )
		ScaleWidgetToLabelRightAligned( self, element, 0 )
	end )
	self:addElement( Text )
	self.Text = Text
	
	self.Text:linkToElementModel( self, "dlcIndex", true, function ( model )
		local dlcIndex = Engine.GetModelValue( model )
		if dlcIndex then
			Text:setText( Engine.Localize( GetBGBDLCStringFromIndex( "ZMUI_DLC_NUM", dlcIndex ) ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				DLCLabelYellowRight:completeAnimation()
				self.DLCLabelYellowRight:setAlpha( 1 )
				self.clipFinished( DLCLabelYellowRight, {} )
				DLCLabelYellowCenter:completeAnimation()
				self.DLCLabelYellowCenter:setAlpha( 1 )
				self.clipFinished( DLCLabelYellowCenter, {} )
				DLCLabelYellowLeft:completeAnimation()
				self.DLCLabelYellowLeft:setAlpha( 1 )
				self.clipFinished( DLCLabelYellowLeft, {} )
				DLCLabelGreyRight:completeAnimation()
				self.DLCLabelGreyRight:setAlpha( 0 )
				self.clipFinished( DLCLabelGreyRight, {} )
				DLCLabelGreyCenter:completeAnimation()
				self.DLCLabelGreyCenter:setAlpha( 0 )
				self.clipFinished( DLCLabelGreyCenter, {} )
				DLCLabelGreyLeft:completeAnimation()
				self.DLCLabelGreyLeft:setAlpha( 0 )
				self.clipFinished( DLCLabelGreyLeft, {} )
				Text:completeAnimation()
				self.Text:setAlpha( 1 )
				self.clipFinished( Text, {} )
			end
		},
		HasDLC = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
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
				self.DLCLabelGreyRight:setAlpha( 0 )
				self.clipFinished( DLCLabelGreyRight, {} )
				DLCLabelGreyCenter:completeAnimation()
				self.DLCLabelGreyCenter:setAlpha( 0 )
				self.clipFinished( DLCLabelGreyCenter, {} )
				DLCLabelGreyLeft:completeAnimation()
				self.DLCLabelGreyLeft:setAlpha( 0 )
				self.clipFinished( DLCLabelGreyLeft, {} )
				Text:completeAnimation()
				self.Text:setAlpha( 0 )
				self.clipFinished( Text, {} )
			end
		},
		Greyscale = {
			DefaultClip = function ()
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
				self.DLCLabelGreyLeft:setImage( RegisterImage( "uie_t7_zombie_dlclabel_left_greyscale" ) )
				self.clipFinished( DLCLabelGreyLeft, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "HasDLC",
			condition = function ( menu, element, event )
				return IsCACItemDLCPurchased( menu, element, controller ) and IsCACItemFromDLC( menu, element, controller )
			end
		},
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "Greyscale",
			condition = function ( menu, element, event )
				local f10_local0 = IsCACItemFromDLC( menu, element, controller )
				if f10_local0 then
					if not IsCACItemDLCPurchased( menu, element, controller ) then
						f10_local0 = AlwaysFalse()
					else
						f10_local0 = false
					end
				end
				return f10_local0
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Text:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

