require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainerHighQuality" )
require( "ui.uieditor.widgets.BubbleGumBuffs.LobbyBubbleGumBuff" )
require( "ui.uieditor.widgets.CAC.GridItemConsumableLabel" )

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
	self:setLeftRight( true, false, 0, 348 )
	self:setTopBottom( true, false, 0, 64 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanelShaderContainer0 = CoD.FE_ButtonPanelShaderContainerHighQuality.new( menu, controller )
	FEButtonPanelShaderContainer0:setLeftRight( true, true, 0, 0 )
	FEButtonPanelShaderContainer0:setTopBottom( true, true, 0, 0 )
	self:addElement( FEButtonPanelShaderContainer0 )
	self.FEButtonPanelShaderContainer0 = FEButtonPanelShaderContainer0
	
	local BackgroundImage = LUI.UIImage.new()
	BackgroundImage:setLeftRight( true, true, 0, 0 )
	BackgroundImage:setTopBottom( true, true, 0, 0 )
	BackgroundImage:setRGB( 0.37, 0.37, 0.37 )
	BackgroundImage:setAlpha( 0.25 )
	self:addElement( BackgroundImage )
	self.BackgroundImage = BackgroundImage
	
	local BubbleGumBuff2 = CoD.LobbyBubbleGumBuff.new( menu, controller )
	BubbleGumBuff2:setLeftRight( false, false, -96, -32 )
	BubbleGumBuff2:setTopBottom( false, false, -32, 32 )
	BubbleGumBuff2:linkToElementModel( self, "bgb2ItemIndex", true, function ( model )
		local bgb2ItemIndex = Engine.GetModelValue( model )
		if bgb2ItemIndex then
			BubbleGumBuff2.BubbleGumBuffImage:setImage( RegisterImage( GetItemImageFromIndexByMode( 0, bgb2ItemIndex ) ) )
		end
	end )
	BubbleGumBuff2:mergeStateConditions( {
		{
			stateName = "OutOfBubbleGum",
			condition = function ( menu, element, event )
				return IsOutOfLobbyBubbleGum2( element, controller )
			end
		}
	} )
	BubbleGumBuff2:linkToElementModel( BubbleGumBuff2, "bgb2ItemIndex", true, function ( model )
		menu:updateElementState( BubbleGumBuff2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb2ItemIndex"
		} )
	end )
	BubbleGumBuff2:linkToElementModel( BubbleGumBuff2, "bgb2Remaining", true, function ( model )
		menu:updateElementState( BubbleGumBuff2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb2Remaining"
		} )
	end )
	self:addElement( BubbleGumBuff2 )
	self.BubbleGumBuff2 = BubbleGumBuff2
	
	local BubbleGumBuff3 = CoD.LobbyBubbleGumBuff.new( menu, controller )
	BubbleGumBuff3:setLeftRight( false, false, -32, 32 )
	BubbleGumBuff3:setTopBottom( false, false, -32, 32 )
	BubbleGumBuff3:linkToElementModel( self, "bgb3ItemIndex", true, function ( model )
		local bgb3ItemIndex = Engine.GetModelValue( model )
		if bgb3ItemIndex then
			BubbleGumBuff3.BubbleGumBuffImage:setImage( RegisterImage( GetItemImageFromIndexByMode( 0, bgb3ItemIndex ) ) )
		end
	end )
	BubbleGumBuff3:mergeStateConditions( {
		{
			stateName = "OutOfBubbleGum",
			condition = function ( menu, element, event )
				return IsOutOfLobbyBubbleGum3( element, controller )
			end
		}
	} )
	BubbleGumBuff3:linkToElementModel( BubbleGumBuff3, "bgb3ItemIndex", true, function ( model )
		menu:updateElementState( BubbleGumBuff3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb3ItemIndex"
		} )
	end )
	BubbleGumBuff3:linkToElementModel( BubbleGumBuff3, "bgb3Remaining", true, function ( model )
		menu:updateElementState( BubbleGumBuff3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb3Remaining"
		} )
	end )
	self:addElement( BubbleGumBuff3 )
	self.BubbleGumBuff3 = BubbleGumBuff3
	
	local BubbleGumBuff4 = CoD.LobbyBubbleGumBuff.new( menu, controller )
	BubbleGumBuff4:setLeftRight( false, false, 32, 96 )
	BubbleGumBuff4:setTopBottom( false, false, -32, 32 )
	BubbleGumBuff4:linkToElementModel( self, "bgb4ItemIndex", true, function ( model )
		local bgb4ItemIndex = Engine.GetModelValue( model )
		if bgb4ItemIndex then
			BubbleGumBuff4.BubbleGumBuffImage:setImage( RegisterImage( GetItemImageFromIndexByMode( 0, bgb4ItemIndex ) ) )
		end
	end )
	BubbleGumBuff4:mergeStateConditions( {
		{
			stateName = "OutOfBubbleGum",
			condition = function ( menu, element, event )
				return IsOutOfLobbyBubbleGum4( element, controller )
			end
		}
	} )
	BubbleGumBuff4:linkToElementModel( BubbleGumBuff4, "bgb4ItemIndex", true, function ( model )
		menu:updateElementState( BubbleGumBuff4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb4ItemIndex"
		} )
	end )
	BubbleGumBuff4:linkToElementModel( BubbleGumBuff4, "bgb4Remaining", true, function ( model )
		menu:updateElementState( BubbleGumBuff4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb4Remaining"
		} )
	end )
	self:addElement( BubbleGumBuff4 )
	self.BubbleGumBuff4 = BubbleGumBuff4
	
	local BubbleGumBuff5 = CoD.LobbyBubbleGumBuff.new( menu, controller )
	BubbleGumBuff5:setLeftRight( false, false, 96, 160 )
	BubbleGumBuff5:setTopBottom( false, false, -32, 32 )
	BubbleGumBuff5:linkToElementModel( self, "bgb5ItemIndex", true, function ( model )
		local bgb5ItemIndex = Engine.GetModelValue( model )
		if bgb5ItemIndex then
			BubbleGumBuff5.BubbleGumBuffImage:setImage( RegisterImage( GetItemImageFromIndexByMode( 0, bgb5ItemIndex ) ) )
		end
	end )
	BubbleGumBuff5:mergeStateConditions( {
		{
			stateName = "OutOfBubbleGum",
			condition = function ( menu, element, event )
				return IsOutOfLobbyBubbleGum5( element, controller )
			end
		}
	} )
	BubbleGumBuff5:linkToElementModel( BubbleGumBuff5, "bgb5ItemIndex", true, function ( model )
		menu:updateElementState( BubbleGumBuff5, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb5ItemIndex"
		} )
	end )
	BubbleGumBuff5:linkToElementModel( BubbleGumBuff5, "bgb5Remaining", true, function ( model )
		menu:updateElementState( BubbleGumBuff5, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb5Remaining"
		} )
	end )
	self:addElement( BubbleGumBuff5 )
	self.BubbleGumBuff5 = BubbleGumBuff5
	
	local BubbleGumBuff1 = CoD.LobbyBubbleGumBuff.new( menu, controller )
	BubbleGumBuff1:setLeftRight( true, false, 14, 78 )
	BubbleGumBuff1:setTopBottom( true, false, 0, 64 )
	BubbleGumBuff1:linkToElementModel( self, "bgb1ItemIndex", true, function ( model )
		local bgb1ItemIndex = Engine.GetModelValue( model )
		if bgb1ItemIndex then
			BubbleGumBuff1.BubbleGumBuffImage:setImage( RegisterImage( GetItemImageFromIndexByMode( 0, bgb1ItemIndex ) ) )
		end
	end )
	BubbleGumBuff1:mergeStateConditions( {
		{
			stateName = "OutOfBubbleGum",
			condition = function ( menu, element, event )
				return IsOutOfLobbyBubbleGum1( element, controller )
			end
		}
	} )
	BubbleGumBuff1:linkToElementModel( BubbleGumBuff1, "bgb1ItemIndex", true, function ( model )
		menu:updateElementState( BubbleGumBuff1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb1ItemIndex"
		} )
	end )
	BubbleGumBuff1:linkToElementModel( BubbleGumBuff1, "bgb1Remaining", true, function ( model )
		menu:updateElementState( BubbleGumBuff1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb1Remaining"
		} )
	end )
	self:addElement( BubbleGumBuff1 )
	self.BubbleGumBuff1 = BubbleGumBuff1
	
	local ConsumableLabel1 = CoD.GridItemConsumableLabel.new( menu, controller )
	ConsumableLabel1:setLeftRight( true, false, 9, 31 )
	ConsumableLabel1:setTopBottom( true, false, 5.75, 23.75 )
	ConsumableLabel1:setScale( 0.8 )
	ConsumableLabel1:linkToElementModel( self, "bgb1Remaining", true, function ( model )
		local bgb1Remaining = Engine.GetModelValue( model )
		if bgb1Remaining then
			ConsumableLabel1.ComsumableCountLabel:setText( Engine.Localize( bgb1Remaining ) )
		end
	end )
	ConsumableLabel1:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsLobbyBubbleGumConsumable( element, controller, "1" )
			end
		},
		{
			stateName = "Nocomsumable",
			condition = function ( menu, element, event )
				return IsOutOfLobbyBubbleGum1( element, controller )
			end
		}
	} )
	ConsumableLabel1:linkToElementModel( ConsumableLabel1, "bgb1ItemIndex", true, function ( model )
		menu:updateElementState( ConsumableLabel1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb1ItemIndex"
		} )
	end )
	ConsumableLabel1:linkToElementModel( ConsumableLabel1, "bgb2ItemIndex", true, function ( model )
		menu:updateElementState( ConsumableLabel1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb2ItemIndex"
		} )
	end )
	ConsumableLabel1:linkToElementModel( ConsumableLabel1, "bgb3ItemIndex", true, function ( model )
		menu:updateElementState( ConsumableLabel1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb3ItemIndex"
		} )
	end )
	ConsumableLabel1:linkToElementModel( ConsumableLabel1, "bgb4ItemIndex", true, function ( model )
		menu:updateElementState( ConsumableLabel1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb4ItemIndex"
		} )
	end )
	ConsumableLabel1:linkToElementModel( ConsumableLabel1, "bgb5ItemIndex", true, function ( model )
		menu:updateElementState( ConsumableLabel1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb5ItemIndex"
		} )
	end )
	ConsumableLabel1:linkToElementModel( ConsumableLabel1, "bgb1Remaining", true, function ( model )
		menu:updateElementState( ConsumableLabel1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb1Remaining"
		} )
	end )
	self:addElement( ConsumableLabel1 )
	self.ConsumableLabel1 = ConsumableLabel1
	
	local ConsumableLabel2 = CoD.GridItemConsumableLabel.new( menu, controller )
	ConsumableLabel2:setLeftRight( true, false, 73, 95 )
	ConsumableLabel2:setTopBottom( true, false, 5.75, 23.75 )
	ConsumableLabel2:setScale( 0.8 )
	ConsumableLabel2:linkToElementModel( self, "bgb2Remaining", true, function ( model )
		local bgb2Remaining = Engine.GetModelValue( model )
		if bgb2Remaining then
			ConsumableLabel2.ComsumableCountLabel:setText( Engine.Localize( bgb2Remaining ) )
		end
	end )
	ConsumableLabel2:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsLobbyBubbleGumConsumable( element, controller, "2" )
			end
		},
		{
			stateName = "Nocomsumable",
			condition = function ( menu, element, event )
				return IsOutOfLobbyBubbleGum2( element, controller )
			end
		}
	} )
	ConsumableLabel2:linkToElementModel( ConsumableLabel2, "bgb1ItemIndex", true, function ( model )
		menu:updateElementState( ConsumableLabel2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb1ItemIndex"
		} )
	end )
	ConsumableLabel2:linkToElementModel( ConsumableLabel2, "bgb2ItemIndex", true, function ( model )
		menu:updateElementState( ConsumableLabel2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb2ItemIndex"
		} )
	end )
	ConsumableLabel2:linkToElementModel( ConsumableLabel2, "bgb3ItemIndex", true, function ( model )
		menu:updateElementState( ConsumableLabel2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb3ItemIndex"
		} )
	end )
	ConsumableLabel2:linkToElementModel( ConsumableLabel2, "bgb4ItemIndex", true, function ( model )
		menu:updateElementState( ConsumableLabel2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb4ItemIndex"
		} )
	end )
	ConsumableLabel2:linkToElementModel( ConsumableLabel2, "bgb5ItemIndex", true, function ( model )
		menu:updateElementState( ConsumableLabel2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb5ItemIndex"
		} )
	end )
	ConsumableLabel2:linkToElementModel( ConsumableLabel2, "bgb2Remaining", true, function ( model )
		menu:updateElementState( ConsumableLabel2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb2Remaining"
		} )
	end )
	self:addElement( ConsumableLabel2 )
	self.ConsumableLabel2 = ConsumableLabel2
	
	local ConsumableLabel3 = CoD.GridItemConsumableLabel.new( menu, controller )
	ConsumableLabel3:setLeftRight( true, false, 137, 159 )
	ConsumableLabel3:setTopBottom( true, false, 5.75, 23.75 )
	ConsumableLabel3:setScale( 0.8 )
	ConsumableLabel3:linkToElementModel( self, "bgb3Remaining", true, function ( model )
		local bgb3Remaining = Engine.GetModelValue( model )
		if bgb3Remaining then
			ConsumableLabel3.ComsumableCountLabel:setText( Engine.Localize( bgb3Remaining ) )
		end
	end )
	ConsumableLabel3:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsLobbyBubbleGumConsumable( element, controller, "3" )
			end
		},
		{
			stateName = "Nocomsumable",
			condition = function ( menu, element, event )
				return IsOutOfLobbyBubbleGum3( element, controller )
			end
		}
	} )
	ConsumableLabel3:linkToElementModel( ConsumableLabel3, "bgb1ItemIndex", true, function ( model )
		menu:updateElementState( ConsumableLabel3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb1ItemIndex"
		} )
	end )
	ConsumableLabel3:linkToElementModel( ConsumableLabel3, "bgb2ItemIndex", true, function ( model )
		menu:updateElementState( ConsumableLabel3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb2ItemIndex"
		} )
	end )
	ConsumableLabel3:linkToElementModel( ConsumableLabel3, "bgb3ItemIndex", true, function ( model )
		menu:updateElementState( ConsumableLabel3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb3ItemIndex"
		} )
	end )
	ConsumableLabel3:linkToElementModel( ConsumableLabel3, "bgb4ItemIndex", true, function ( model )
		menu:updateElementState( ConsumableLabel3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb4ItemIndex"
		} )
	end )
	ConsumableLabel3:linkToElementModel( ConsumableLabel3, "bgb5ItemIndex", true, function ( model )
		menu:updateElementState( ConsumableLabel3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb5ItemIndex"
		} )
	end )
	ConsumableLabel3:linkToElementModel( ConsumableLabel3, "bgb3Remaining", true, function ( model )
		menu:updateElementState( ConsumableLabel3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb3Remaining"
		} )
	end )
	self:addElement( ConsumableLabel3 )
	self.ConsumableLabel3 = ConsumableLabel3
	
	local ConsumableLabel4 = CoD.GridItemConsumableLabel.new( menu, controller )
	ConsumableLabel4:setLeftRight( true, false, 201, 223 )
	ConsumableLabel4:setTopBottom( true, false, 5.75, 23.75 )
	ConsumableLabel4:setScale( 0.8 )
	ConsumableLabel4:linkToElementModel( self, "bgb4Remaining", true, function ( model )
		local bgb4Remaining = Engine.GetModelValue( model )
		if bgb4Remaining then
			ConsumableLabel4.ComsumableCountLabel:setText( Engine.Localize( bgb4Remaining ) )
		end
	end )
	ConsumableLabel4:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsLobbyBubbleGumConsumable( element, controller, "4" )
			end
		},
		{
			stateName = "Nocomsumable",
			condition = function ( menu, element, event )
				return IsOutOfLobbyBubbleGum4( element, controller )
			end
		}
	} )
	ConsumableLabel4:linkToElementModel( ConsumableLabel4, "bgb1ItemIndex", true, function ( model )
		menu:updateElementState( ConsumableLabel4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb1ItemIndex"
		} )
	end )
	ConsumableLabel4:linkToElementModel( ConsumableLabel4, "bgb2ItemIndex", true, function ( model )
		menu:updateElementState( ConsumableLabel4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb2ItemIndex"
		} )
	end )
	ConsumableLabel4:linkToElementModel( ConsumableLabel4, "bgb3ItemIndex", true, function ( model )
		menu:updateElementState( ConsumableLabel4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb3ItemIndex"
		} )
	end )
	ConsumableLabel4:linkToElementModel( ConsumableLabel4, "bgb4ItemIndex", true, function ( model )
		menu:updateElementState( ConsumableLabel4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb4ItemIndex"
		} )
	end )
	ConsumableLabel4:linkToElementModel( ConsumableLabel4, "bgb5ItemIndex", true, function ( model )
		menu:updateElementState( ConsumableLabel4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb5ItemIndex"
		} )
	end )
	ConsumableLabel4:linkToElementModel( ConsumableLabel4, "bgb4Remaining", true, function ( model )
		menu:updateElementState( ConsumableLabel4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb4Remaining"
		} )
	end )
	self:addElement( ConsumableLabel4 )
	self.ConsumableLabel4 = ConsumableLabel4
	
	local ConsumableLabel5 = CoD.GridItemConsumableLabel.new( menu, controller )
	ConsumableLabel5:setLeftRight( true, false, 265, 287 )
	ConsumableLabel5:setTopBottom( true, false, 5.75, 23.75 )
	ConsumableLabel5:setScale( 0.8 )
	ConsumableLabel5:linkToElementModel( self, "bgb5Remaining", true, function ( model )
		local bgb5Remaining = Engine.GetModelValue( model )
		if bgb5Remaining then
			ConsumableLabel5.ComsumableCountLabel:setText( Engine.Localize( bgb5Remaining ) )
		end
	end )
	ConsumableLabel5:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsLobbyBubbleGumConsumable( element, controller, "5" )
			end
		},
		{
			stateName = "Nocomsumable",
			condition = function ( menu, element, event )
				return IsOutOfLobbyBubbleGum5( element, controller )
			end
		}
	} )
	ConsumableLabel5:linkToElementModel( ConsumableLabel5, "bgb1ItemIndex", true, function ( model )
		menu:updateElementState( ConsumableLabel5, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb1ItemIndex"
		} )
	end )
	ConsumableLabel5:linkToElementModel( ConsumableLabel5, "bgb2ItemIndex", true, function ( model )
		menu:updateElementState( ConsumableLabel5, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb2ItemIndex"
		} )
	end )
	ConsumableLabel5:linkToElementModel( ConsumableLabel5, "bgb3ItemIndex", true, function ( model )
		menu:updateElementState( ConsumableLabel5, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb3ItemIndex"
		} )
	end )
	ConsumableLabel5:linkToElementModel( ConsumableLabel5, "bgb4ItemIndex", true, function ( model )
		menu:updateElementState( ConsumableLabel5, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb4ItemIndex"
		} )
	end )
	ConsumableLabel5:linkToElementModel( ConsumableLabel5, "bgb5ItemIndex", true, function ( model )
		menu:updateElementState( ConsumableLabel5, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb5ItemIndex"
		} )
	end )
	ConsumableLabel5:linkToElementModel( ConsumableLabel5, "bgb5Remaining", true, function ( model )
		menu:updateElementState( ConsumableLabel5, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bgb5Remaining"
		} )
	end )
	self:addElement( ConsumableLabel5 )
	self.ConsumableLabel5 = ConsumableLabel5
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 5 )
				ConsumableLabel1:completeAnimation()
				self.ConsumableLabel1:setAlpha( 1 )
				self.clipFinished( ConsumableLabel1, {} )
				ConsumableLabel2:completeAnimation()
				self.ConsumableLabel2:setAlpha( 1 )
				self.clipFinished( ConsumableLabel2, {} )
				ConsumableLabel3:completeAnimation()
				self.ConsumableLabel3:setAlpha( 1 )
				self.clipFinished( ConsumableLabel3, {} )
				ConsumableLabel4:completeAnimation()
				self.ConsumableLabel4:setAlpha( 1 )
				self.clipFinished( ConsumableLabel4, {} )
				ConsumableLabel5:completeAnimation()
				self.ConsumableLabel5:setAlpha( 1 )
				self.clipFinished( ConsumableLabel5, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanelShaderContainer0:close()
		element.BubbleGumBuff2:close()
		element.BubbleGumBuff3:close()
		element.BubbleGumBuff4:close()
		element.BubbleGumBuff5:close()
		element.BubbleGumBuff1:close()
		element.ConsumableLabel1:close()
		element.ConsumableLabel2:close()
		element.ConsumableLabel3:close()
		element.ConsumableLabel4:close()
		element.ConsumableLabel5:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

