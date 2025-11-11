require( "ui.uieditor.widgets.BubbleGumBuffs.LobbyBubbleGumBuff" )
require( "ui.uieditor.widgets.CAC.GridItemConsumableLabel" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainerHighQuality" )

CoD.LobbyMemberBubbleGumBuffs = InheritFrom( LUI.UIElement )
CoD.LobbyMemberBubbleGumBuffs.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyMemberBubbleGumBuffs )
	self.id = "LobbyMemberBubbleGumBuffs"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 522 )
	self:setTopBottom( 0, 0, 0, 96 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanelShaderContainer0 = CoD.FE_ButtonPanelShaderContainerHighQuality.new( menu, controller )
	FEButtonPanelShaderContainer0:setLeftRight( 0, 1, 0, 0 )
	FEButtonPanelShaderContainer0:setTopBottom( 0, 1, 0, 0 )
	self:addElement( FEButtonPanelShaderContainer0 )
	self.FEButtonPanelShaderContainer0 = FEButtonPanelShaderContainer0
	
	local BackgroundImage = LUI.UIImage.new()
	BackgroundImage:setLeftRight( 0, 1, 0, 0 )
	BackgroundImage:setTopBottom( 0, 1, 0, 0 )
	BackgroundImage:setRGB( 0.37, 0.37, 0.37 )
	BackgroundImage:setAlpha( 0.25 )
	self:addElement( BackgroundImage )
	self.BackgroundImage = BackgroundImage
	
	local BubbleGumBuff1 = CoD.LobbyBubbleGumBuff.new( menu, controller )
	BubbleGumBuff1:setLeftRight( 0, 0, 21, 117 )
	BubbleGumBuff1:setTopBottom( 0, 0, 0, 96 )
	BubbleGumBuff1:linkToElementModel( self, "bgb1", false, function ( model )
		BubbleGumBuff1:setModel( model, controller )
	end )
	BubbleGumBuff1:linkToElementModel( self, "bgb1.itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BubbleGumBuff1.BubbleGumBuffImage:setImage( RegisterImage( GetItemImageFromIndexByMode( 0, modelValue ) ) )
		end
	end )
	self:addElement( BubbleGumBuff1 )
	self.BubbleGumBuff1 = BubbleGumBuff1
	
	local BubbleGumBuff2 = CoD.LobbyBubbleGumBuff.new( menu, controller )
	BubbleGumBuff2:setLeftRight( 0.5, 0.5, -144, -48 )
	BubbleGumBuff2:setTopBottom( 0.5, 0.5, -48, 48 )
	BubbleGumBuff2:linkToElementModel( self, "bgb2", false, function ( model )
		BubbleGumBuff2:setModel( model, controller )
	end )
	BubbleGumBuff2:linkToElementModel( self, "bgb2.itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BubbleGumBuff2.BubbleGumBuffImage:setImage( RegisterImage( GetItemImageFromIndexByMode( 0, modelValue ) ) )
		end
	end )
	self:addElement( BubbleGumBuff2 )
	self.BubbleGumBuff2 = BubbleGumBuff2
	
	local BubbleGumBuff3 = CoD.LobbyBubbleGumBuff.new( menu, controller )
	BubbleGumBuff3:setLeftRight( 0.5, 0.5, -48, 48 )
	BubbleGumBuff3:setTopBottom( 0.5, 0.5, -48, 48 )
	BubbleGumBuff3:linkToElementModel( self, "bgb3", false, function ( model )
		BubbleGumBuff3:setModel( model, controller )
	end )
	BubbleGumBuff3:linkToElementModel( self, "bgb3.itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BubbleGumBuff3.BubbleGumBuffImage:setImage( RegisterImage( GetItemImageFromIndexByMode( 0, modelValue ) ) )
		end
	end )
	self:addElement( BubbleGumBuff3 )
	self.BubbleGumBuff3 = BubbleGumBuff3
	
	local BubbleGumBuff4 = CoD.LobbyBubbleGumBuff.new( menu, controller )
	BubbleGumBuff4:setLeftRight( 0.5, 0.5, 48, 144 )
	BubbleGumBuff4:setTopBottom( 0.5, 0.5, -48, 48 )
	BubbleGumBuff4:linkToElementModel( self, "bgb4", false, function ( model )
		BubbleGumBuff4:setModel( model, controller )
	end )
	BubbleGumBuff4:linkToElementModel( self, "bgb4.itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BubbleGumBuff4.BubbleGumBuffImage:setImage( RegisterImage( GetItemImageFromIndexByMode( 0, modelValue ) ) )
		end
	end )
	self:addElement( BubbleGumBuff4 )
	self.BubbleGumBuff4 = BubbleGumBuff4
	
	local BubbleGumBuff5 = CoD.LobbyBubbleGumBuff.new( menu, controller )
	BubbleGumBuff5:setLeftRight( 0.5, 0.5, 144, 240 )
	BubbleGumBuff5:setTopBottom( 0.5, 0.5, -48, 48 )
	BubbleGumBuff5:linkToElementModel( self, "bgb5", false, function ( model )
		BubbleGumBuff5:setModel( model, controller )
	end )
	BubbleGumBuff5:linkToElementModel( self, "bgb5.itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BubbleGumBuff5.BubbleGumBuffImage:setImage( RegisterImage( GetItemImageFromIndexByMode( 0, modelValue ) ) )
		end
	end )
	self:addElement( BubbleGumBuff5 )
	self.BubbleGumBuff5 = BubbleGumBuff5
	
	local ConsumableLabel1 = CoD.GridItemConsumableLabel.new( menu, controller )
	ConsumableLabel1:mergeStateConditions( {
		{
			stateName = "Nocomsumable",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "remaining", 0 )
			end
		}
	} )
	ConsumableLabel1:linkToElementModel( ConsumableLabel1, "itemIndex", true, function ( model )
		menu:updateElementState( ConsumableLabel1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	ConsumableLabel1:linkToElementModel( ConsumableLabel1, "remaining", true, function ( model )
		menu:updateElementState( ConsumableLabel1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "remaining"
		} )
	end )
	ConsumableLabel1:setLeftRight( 0, 0, 13, 46 )
	ConsumableLabel1:setTopBottom( 0, 0, 9, 36 )
	ConsumableLabel1:setScale( 0.8 )
	ConsumableLabel1:linkToElementModel( self, "bgb1", false, function ( model )
		ConsumableLabel1:setModel( model, controller )
	end )
	self:addElement( ConsumableLabel1 )
	self.ConsumableLabel1 = ConsumableLabel1
	
	local ConsumableLabel2 = CoD.GridItemConsumableLabel.new( menu, controller )
	ConsumableLabel2:mergeStateConditions( {
		{
			stateName = "Nocomsumable",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "remaining", 0 )
			end
		}
	} )
	ConsumableLabel2:linkToElementModel( ConsumableLabel2, "itemIndex", true, function ( model )
		menu:updateElementState( ConsumableLabel2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	ConsumableLabel2:linkToElementModel( ConsumableLabel2, "remaining", true, function ( model )
		menu:updateElementState( ConsumableLabel2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "remaining"
		} )
	end )
	ConsumableLabel2:setLeftRight( 0, 0, 109, 142 )
	ConsumableLabel2:setTopBottom( 0, 0, 9, 36 )
	ConsumableLabel2:setScale( 0.8 )
	ConsumableLabel2:linkToElementModel( self, "bgb2", false, function ( model )
		ConsumableLabel2:setModel( model, controller )
	end )
	self:addElement( ConsumableLabel2 )
	self.ConsumableLabel2 = ConsumableLabel2
	
	local ConsumableLabel3 = CoD.GridItemConsumableLabel.new( menu, controller )
	ConsumableLabel3:mergeStateConditions( {
		{
			stateName = "Nocomsumable",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "remaining", 0 )
			end
		}
	} )
	ConsumableLabel3:linkToElementModel( ConsumableLabel3, "itemIndex", true, function ( model )
		menu:updateElementState( ConsumableLabel3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	ConsumableLabel3:linkToElementModel( ConsumableLabel3, "remaining", true, function ( model )
		menu:updateElementState( ConsumableLabel3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "remaining"
		} )
	end )
	ConsumableLabel3:setLeftRight( 0, 0, 205, 238 )
	ConsumableLabel3:setTopBottom( 0, 0, 9, 36 )
	ConsumableLabel3:setScale( 0.8 )
	ConsumableLabel3:linkToElementModel( self, "bgb3", false, function ( model )
		ConsumableLabel3:setModel( model, controller )
	end )
	self:addElement( ConsumableLabel3 )
	self.ConsumableLabel3 = ConsumableLabel3
	
	local ConsumableLabel4 = CoD.GridItemConsumableLabel.new( menu, controller )
	ConsumableLabel4:mergeStateConditions( {
		{
			stateName = "Nocomsumable",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "remaining", 0 )
			end
		}
	} )
	ConsumableLabel4:linkToElementModel( ConsumableLabel4, "itemIndex", true, function ( model )
		menu:updateElementState( ConsumableLabel4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	ConsumableLabel4:linkToElementModel( ConsumableLabel4, "remaining", true, function ( model )
		menu:updateElementState( ConsumableLabel4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "remaining"
		} )
	end )
	ConsumableLabel4:setLeftRight( 0, 0, 301, 334 )
	ConsumableLabel4:setTopBottom( 0, 0, 9, 36 )
	ConsumableLabel4:setScale( 0.8 )
	ConsumableLabel4:linkToElementModel( self, "bgb4", false, function ( model )
		ConsumableLabel4:setModel( model, controller )
	end )
	self:addElement( ConsumableLabel4 )
	self.ConsumableLabel4 = ConsumableLabel4
	
	local ConsumableLabel5 = CoD.GridItemConsumableLabel.new( menu, controller )
	ConsumableLabel5:mergeStateConditions( {
		{
			stateName = "Nocomsumable",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "remaining", 0 )
			end
		}
	} )
	ConsumableLabel5:linkToElementModel( ConsumableLabel5, "itemIndex", true, function ( model )
		menu:updateElementState( ConsumableLabel5, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	ConsumableLabel5:linkToElementModel( ConsumableLabel5, "remaining", true, function ( model )
		menu:updateElementState( ConsumableLabel5, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "remaining"
		} )
	end )
	ConsumableLabel5:setLeftRight( 0, 0, 397, 430 )
	ConsumableLabel5:setTopBottom( 0, 0, 9, 36 )
	ConsumableLabel5:setScale( 0.8 )
	ConsumableLabel5:linkToElementModel( self, "bgb5", false, function ( model )
		ConsumableLabel5:setModel( model, controller )
	end )
	self:addElement( ConsumableLabel5 )
	self.ConsumableLabel5 = ConsumableLabel5
	
	self.resetProperties = function ()
		ConsumableLabel1:completeAnimation()
		ConsumableLabel2:completeAnimation()
		ConsumableLabel3:completeAnimation()
		ConsumableLabel4:completeAnimation()
		ConsumableLabel5:completeAnimation()
		ConsumableLabel1:setAlpha( 1 )
		ConsumableLabel2:setAlpha( 1 )
		ConsumableLabel3:setAlpha( 1 )
		ConsumableLabel4:setAlpha( 1 )
		ConsumableLabel5:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				ConsumableLabel1:completeAnimation()
				self.ConsumableLabel1:setAlpha( 0 )
				self.clipFinished( ConsumableLabel1, {} )
				ConsumableLabel2:completeAnimation()
				self.ConsumableLabel2:setAlpha( 0 )
				self.clipFinished( ConsumableLabel2, {} )
				ConsumableLabel3:completeAnimation()
				self.ConsumableLabel3:setAlpha( 0 )
				self.clipFinished( ConsumableLabel3, {} )
				ConsumableLabel4:completeAnimation()
				self.ConsumableLabel4:setAlpha( 0 )
				self.clipFinished( ConsumableLabel4, {} )
				ConsumableLabel5:completeAnimation()
				self.ConsumableLabel5:setAlpha( 0 )
				self.clipFinished( ConsumableLabel5, {} )
			end
		},
		IsSelf = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "IsSelf",
			condition = function ( menu, element, event )
				return IsSelfItem( element, controller )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEButtonPanelShaderContainer0:close()
		self.BubbleGumBuff1:close()
		self.BubbleGumBuff2:close()
		self.BubbleGumBuff3:close()
		self.BubbleGumBuff4:close()
		self.BubbleGumBuff5:close()
		self.ConsumableLabel1:close()
		self.ConsumableLabel2:close()
		self.ConsumableLabel3:close()
		self.ConsumableLabel4:close()
		self.ConsumableLabel5:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

