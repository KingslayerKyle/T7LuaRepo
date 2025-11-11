CoD.BubbleGumBuffDescription = InheritFrom( LUI.UIElement )
CoD.BubbleGumBuffDescription.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BubbleGumBuffDescription )
	self.id = "BubbleGumBuffDescription"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 480 )
	self:setTopBottom( 0, 0, 0, 28 )
	
	local SplitscreenDLCWarning = LUI.UIText.new()
	SplitscreenDLCWarning:setLeftRight( 0, 0, 0, 480 )
	SplitscreenDLCWarning:setTopBottom( 1, 1, 0, 28 )
	SplitscreenDLCWarning:setAlpha( 0 )
	SplitscreenDLCWarning:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	SplitscreenDLCWarning:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SplitscreenDLCWarning:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	SplitscreenDLCWarning:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SplitscreenDLCWarning:setText( Engine.Localize( GetBGBSplitscreenWarning( controller, modelValue ) ) )
		end
	end )
	self:addElement( SplitscreenDLCWarning )
	self.SplitscreenDLCWarning = SplitscreenDLCWarning
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( 0, 0, 0, 480 )
	TextBox0:setTopBottom( 0, 0, 0, 28 )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox0:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextBox0:setText( Engine.Localize( GetBGBDescription( controller, modelValue ) ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( TextBox0, "setText", function ( element, text )
		UpdateWidgetHeightToMultilineText( self, element, 0 )
	end )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	self.resetProperties = function ()
		SplitscreenDLCWarning:completeAnimation()
		SplitscreenDLCWarning:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				SplitscreenDLCWarning:completeAnimation()
				self.SplitscreenDLCWarning:setAlpha( 1 )
				self.clipFinished( SplitscreenDLCWarning, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f8_local0 = IsCACItemFromDLC( menu, element, controller )
				if f8_local0 then
					f8_local0 = IsBGBUnlockedForOtherSplitscreenPlayers( menu, element, controller )
					if f8_local0 then
						f8_local0 = IsBGBItemLocked( menu, element, controller )
					end
				end
				return f8_local0
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
		self.SplitscreenDLCWarning:close()
		self.TextBox0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

