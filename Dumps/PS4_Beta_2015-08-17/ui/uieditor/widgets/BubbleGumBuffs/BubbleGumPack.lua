require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumBuff" )

CoD.BubbleGumPack = InheritFrom( LUI.UIElement )
CoD.BubbleGumPack.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BubbleGumPack )
	self.id = "BubbleGumPack"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 368 )
	self:setTopBottom( true, false, 0, 149 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BubbleGumPackTitleBackground = LUI.UIImage.new()
	BubbleGumPackTitleBackground:setLeftRight( true, true, 0, 0 )
	BubbleGumPackTitleBackground:setTopBottom( true, false, 0, 38 )
	BubbleGumPackTitleBackground:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( BubbleGumPackTitleBackground )
	self.BubbleGumPackTitleBackground = BubbleGumPackTitleBackground
	
	local BubbleGumPackLabel = LUI.UITightText.new()
	BubbleGumPackLabel:setLeftRight( true, false, 10, 10 )
	BubbleGumPackLabel:setTopBottom( true, false, 2, 36 )
	BubbleGumPackLabel:setTTF( "fonts/default.ttf" )
	BubbleGumPackLabel:subscribeToGlobalModel( controller, "EquippedBubbleGumPack", "bgbPackIndex", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BubbleGumPackLabel:setText( Engine.Localize( GetBubbleGumPackNameFromPackIndex( controller, modelValue ) ) )
		end
	end )
	self:addElement( BubbleGumPackLabel )
	self.BubbleGumPackLabel = BubbleGumPackLabel
	
	local BubbleGumPackBackground = LUI.UIImage.new()
	BubbleGumPackBackground:setLeftRight( true, true, 0, 0 )
	BubbleGumPackBackground:setTopBottom( true, true, 40, 0 )
	BubbleGumPackBackground:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( BubbleGumPackBackground )
	self.BubbleGumPackBackground = BubbleGumPackBackground
	
	local BubbleGumBuffs = LUI.UIList.new( menu, controller, 10, 0, nil, false, false, 0, 0, false, false )
	BubbleGumBuffs:makeFocusable()
	BubbleGumBuffs:setLeftRight( true, false, 4, 364 )
	BubbleGumBuffs:setTopBottom( true, false, 40, 149 )
	BubbleGumBuffs:setDataSource( "BubbleGumBuffs" )
	BubbleGumBuffs:setWidgetType( CoD.BubbleGumBuff )
	BubbleGumBuffs:setHorizontalCount( 5 )
	BubbleGumBuffs:setSpacing( 10 )
	self:addElement( BubbleGumBuffs )
	self.BubbleGumBuffs = BubbleGumBuffs
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				BubbleGumPackTitleBackground:completeAnimation()
				self.BubbleGumPackTitleBackground:setRGB( 0.5, 0.5, 0.5 )
				self.clipFinished( BubbleGumPackTitleBackground, {} )
				BubbleGumPackBackground:completeAnimation()
				self.BubbleGumPackBackground:setRGB( 0.5, 0.5, 0.5 )
				self.clipFinished( BubbleGumPackBackground, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )
				BubbleGumPackTitleBackground:completeAnimation()
				self.BubbleGumPackTitleBackground:setRGB( 0.93, 0.45, 0.05 )
				self.clipFinished( BubbleGumPackTitleBackground, {} )
				BubbleGumPackBackground:completeAnimation()
				self.BubbleGumPackBackground:setRGB( 0.93, 0.45, 0.05 )
				self.clipFinished( BubbleGumPackBackground, {} )
			end
		}
	}
	BubbleGumBuffs.id = "BubbleGumBuffs"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.BubbleGumBuffs:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BubbleGumBuffs:close()
		self.BubbleGumPackLabel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

