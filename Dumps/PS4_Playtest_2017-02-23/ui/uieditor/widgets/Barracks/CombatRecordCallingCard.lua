require( "ui.uieditor.widgets.Barracks.CombatRecordCallingCardDescription" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.Scorestreaks.scorestreaks_BoxLabel" )

CoD.CombatRecordCallingCard = InheritFrom( LUI.UIElement )
CoD.CombatRecordCallingCard.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CombatRecordCallingCard )
	self.id = "CombatRecordCallingCard"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 450 )
	self:setTopBottom( 0, 0, 0, 112 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local Border = LUI.UIImage.new()
	Border:setLeftRight( 0, 1, 0, 0 )
	Border:setTopBottom( 0, 1, 0, 0 )
	Border:setAlpha( 0 )
	Border:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	Border:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Border:setShaderVector( 0, 0, 0, 0, 0 )
	Border:setupNineSliceShader( 6, 6 )
	self:addElement( Border )
	self.Border = Border
	
	local CardIcon = CoD.CallingCards_FrameWidget.new( menu, controller )
	CardIcon:setLeftRight( 0.5, 0.5, -360, 360 )
	CardIcon:setTopBottom( 0.5, 0.5, -90, 90 )
	CardIcon.CardIconFrame:setScale( 0.63 )
	CardIcon:linkToElementModel( self, nil, false, function ( model )
		CardIcon:setModel( model, controller )
	end )
	self:addElement( CardIcon )
	self.CardIcon = CardIcon
	
	local CallingCardName = CoD.scorestreaks_BoxLabel.new( menu, controller )
	CallingCardName:setLeftRight( 0, 0, 0, 453 )
	CallingCardName:setTopBottom( 1, 1, -28, 0 )
	CallingCardName:linkToElementModel( self, "title", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CallingCardName.name:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( CallingCardName )
	self.CallingCardName = CallingCardName
	
	local CombatRecordCallingCardDescription = CoD.CombatRecordCallingCardDescription.new( menu, controller )
	CombatRecordCallingCardDescription:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNonEmptyString( element, controller, "description" )
			end
		}
	} )
	CombatRecordCallingCardDescription:linkToElementModel( CombatRecordCallingCardDescription, "description", true, function ( model )
		menu:updateElementState( CombatRecordCallingCardDescription, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "description"
		} )
	end )
	CombatRecordCallingCardDescription:setLeftRight( 0.5, 0.5, -141, 141 )
	CombatRecordCallingCardDescription:setTopBottom( 0.5, 0.5, -24, 24 )
	CombatRecordCallingCardDescription:linkToElementModel( self, nil, false, function ( model )
		CombatRecordCallingCardDescription:setModel( model, controller )
	end )
	CombatRecordCallingCardDescription:linkToElementModel( self, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CombatRecordCallingCardDescription.textCenterAlign:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( CombatRecordCallingCardDescription )
	self.CombatRecordCallingCardDescription = CombatRecordCallingCardDescription
	
	local TopFocusBar = CoD.FE_FocusBarContainer.new( menu, controller )
	TopFocusBar:setLeftRight( 0, 1, -3, 3 )
	TopFocusBar:setTopBottom( 0, 0, -1, 5 )
	self:addElement( TopFocusBar )
	self.TopFocusBar = TopFocusBar
	
	local BottomFocusBar = CoD.FE_FocusBarContainer.new( menu, controller )
	BottomFocusBar:setLeftRight( 0, 1, -3, 3 )
	BottomFocusBar:setTopBottom( 1, 1, -5, 1 )
	self:addElement( BottomFocusBar )
	self.BottomFocusBar = BottomFocusBar
	
	self.resetProperties = function ()
		TopFocusBar:completeAnimation()
		BottomFocusBar:completeAnimation()
		CombatRecordCallingCardDescription:completeAnimation()
		CardIcon:completeAnimation()
		CallingCardName:completeAnimation()
		Border:completeAnimation()
		TopFocusBar:setAlpha( 1 )
		BottomFocusBar:setAlpha( 1 )
		CombatRecordCallingCardDescription:setAlpha( 1 )
		CardIcon:setAlpha( 1 )
		CallingCardName:setAlpha( 1 )
		Border:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				CombatRecordCallingCardDescription:completeAnimation()
				self.CombatRecordCallingCardDescription:setAlpha( 0 )
				self.clipFinished( CombatRecordCallingCardDescription, {} )
				TopFocusBar:completeAnimation()
				self.TopFocusBar:setAlpha( 0 )
				self.clipFinished( TopFocusBar, {} )
				BottomFocusBar:completeAnimation()
				self.BottomFocusBar:setAlpha( 0 )
				self.clipFinished( BottomFocusBar, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				CombatRecordCallingCardDescription:completeAnimation()
				self.CombatRecordCallingCardDescription:setAlpha( 0 )
				self.clipFinished( CombatRecordCallingCardDescription, {} )
			end
		},
		EmptyCallingCard = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				Border:completeAnimation()
				self.Border:setAlpha( 1 )
				self.clipFinished( Border, {} )
				CardIcon:completeAnimation()
				self.CardIcon:setAlpha( 0 )
				self.clipFinished( CardIcon, {} )
				CallingCardName:completeAnimation()
				self.CallingCardName:setAlpha( 0 )
				self.clipFinished( CallingCardName, {} )
				TopFocusBar:completeAnimation()
				self.TopFocusBar:setAlpha( 0 )
				self.clipFinished( TopFocusBar, {} )
				BottomFocusBar:completeAnimation()
				self.BottomFocusBar:setAlpha( 0 )
				self.clipFinished( BottomFocusBar, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "EmptyCallingCard",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "backgroundId", 0 )
			end
		}
	} )
	self:linkToElementModel( self, "backgroundId", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "backgroundId"
		} )
	end )
	CardIcon.id = "CardIcon"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CardIcon:close()
		self.CallingCardName:close()
		self.CombatRecordCallingCardDescription:close()
		self.TopFocusBar:close()
		self.BottomFocusBar:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

