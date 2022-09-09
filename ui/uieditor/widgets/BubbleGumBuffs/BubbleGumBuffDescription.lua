-- 07b3f59a0fb0080b112c300045c390a9
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 320 )
	self:setTopBottom( true, false, 0, 19 )
	
	local SplitscreenDLCWarning = LUI.UIText.new()
	SplitscreenDLCWarning:setLeftRight( true, false, 0, 320 )
	SplitscreenDLCWarning:setTopBottom( false, true, 0, 19 )
	SplitscreenDLCWarning:setAlpha( 0 )
	SplitscreenDLCWarning:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	SplitscreenDLCWarning:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SplitscreenDLCWarning:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	SplitscreenDLCWarning:linkToElementModel( self, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			SplitscreenDLCWarning:setText( Engine.Localize( GetBGBSplitscreenWarning( controller, itemIndex ) ) )
		end
	end )
	self:addElement( SplitscreenDLCWarning )
	self.SplitscreenDLCWarning = SplitscreenDLCWarning
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 0, 320 )
	TextBox0:setTopBottom( true, false, 0, 19 )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox0:linkToElementModel( self, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			TextBox0:setText( Engine.Localize( GetBGBDescription( controller, itemIndex ) ) )
		end
	end )

	LUI.OverrideFunction_CallOriginalFirst( TextBox0, "setText", function ( element, controller )
		UpdateWidgetHeightToMultilineText( self, element, 0 )
	end )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				SplitscreenDLCWarning:completeAnimation()
				self.SplitscreenDLCWarning:setAlpha( 0 )
				self.clipFinished( SplitscreenDLCWarning, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
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
				local f7_local0 = IsCACItemFromDLC( menu, element, controller )
				if f7_local0 then
					f7_local0 = IsBGBUnlockedForOtherSplitscreenPlayers( menu, element, controller )
					if f7_local0 then
						f7_local0 = IsBGBItemLocked( menu, element, controller )
					end
				end
				return f7_local0
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
		element.SplitscreenDLCWarning:close()
		element.TextBox0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
