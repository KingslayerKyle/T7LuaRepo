require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )
require( "ui.uieditor.widgets.Scorestreaks.scorestreaks_BoxLabel" )
require( "ui.uieditor.widgets.Barracks.CombatRecordCallingCardDescription" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.HintTextArrow" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

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
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 75 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local Border = LUI.UIImage.new()
	Border:setLeftRight( true, true, 0, 0 )
	Border:setTopBottom( true, true, 0, 0 )
	Border:setAlpha( 0 )
	Border:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	Border:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Border:setShaderVector( 0, 0.01, 0.05, 0, 0 )
	Border:setupNineSliceShader( 4, 4 )
	self:addElement( Border )
	self.Border = Border
	
	local CardIcon = CoD.CallingCards_FrameWidget.new( menu, controller )
	CardIcon:setLeftRight( false, false, -240, 240 )
	CardIcon:setTopBottom( false, false, -60, 60 )
	CardIcon.CardIconFrame:setScale( 0.63 )
	CardIcon:linkToElementModel( self, nil, false, function ( model )
		CardIcon:setModel( model, controller )
	end )
	self:addElement( CardIcon )
	self.CardIcon = CardIcon
	
	local CallingCardName = CoD.scorestreaks_BoxLabel.new( menu, controller )
	CallingCardName:setLeftRight( true, false, 0, 302 )
	CallingCardName:setTopBottom( false, true, -19, 0 )
	CallingCardName:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			CallingCardName.name:setText( Engine.Localize( title ) )
		end
	end )
	self:addElement( CallingCardName )
	self.CallingCardName = CallingCardName
	
	local CombatRecordCallingCardDescription = CoD.CombatRecordCallingCardDescription.new( menu, controller )
	CombatRecordCallingCardDescription:setLeftRight( false, false, -150, 150 )
	CombatRecordCallingCardDescription:setTopBottom( false, true, 15, 47 )
	CombatRecordCallingCardDescription:setAlpha( 0 )
	CombatRecordCallingCardDescription:linkToElementModel( self, nil, false, function ( model )
		CombatRecordCallingCardDescription:setModel( model, controller )
	end )
	CombatRecordCallingCardDescription:linkToElementModel( self, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			CombatRecordCallingCardDescription.textCenterAlign:setText( Engine.Localize( description ) )
		end
	end )
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
	self:addElement( CombatRecordCallingCardDescription )
	self.CombatRecordCallingCardDescription = CombatRecordCallingCardDescription
	
	local hintArrow = CoD.HintTextArrow.new( menu, controller )
	hintArrow:setLeftRight( false, false, -5, 5 )
	hintArrow:setTopBottom( false, true, 5, 15 )
	hintArrow:setAlpha( 0 )
	hintArrow:linkToElementModel( self, nil, false, function ( model )
		hintArrow:setModel( model, controller )
	end )
	hintArrow:mergeStateConditions( {
		{
			stateName = "NoHintText",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "description", "" )
			end
		}
	} )
	hintArrow:linkToElementModel( hintArrow, "description", true, function ( model )
		menu:updateElementState( hintArrow, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "description"
		} )
	end )
	self:addElement( hintArrow )
	self.hintArrow = hintArrow
	
	local TopFocusBar = CoD.FE_FocusBarContainer.new( menu, controller )
	TopFocusBar:setLeftRight( true, true, -2, 2 )
	TopFocusBar:setTopBottom( true, false, -1, 3 )
	self:addElement( TopFocusBar )
	self.TopFocusBar = TopFocusBar
	
	local BottomFocusBar = CoD.FE_FocusBarContainer.new( menu, controller )
	BottomFocusBar:setLeftRight( true, true, -2, 2 )
	BottomFocusBar:setTopBottom( false, true, -3, 1 )
	self:addElement( BottomFocusBar )
	self.BottomFocusBar = BottomFocusBar
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				CardIcon:completeAnimation()
				self.CardIcon:setAlpha( 1 )
				self.clipFinished( CardIcon, {} )
				CallingCardName:completeAnimation()
				self.CallingCardName:setAlpha( 1 )
				self.clipFinished( CallingCardName, {} )
				CombatRecordCallingCardDescription:completeAnimation()
				self.CombatRecordCallingCardDescription:setAlpha( 0 )
				self.clipFinished( CombatRecordCallingCardDescription, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 0 )
				self.clipFinished( hintArrow, {} )
				TopFocusBar:completeAnimation()
				self.TopFocusBar:setAlpha( 0 )
				self.clipFinished( TopFocusBar, {} )
				BottomFocusBar:completeAnimation()
				self.BottomFocusBar:setAlpha( 0 )
				self.clipFinished( BottomFocusBar, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				CombatRecordCallingCardDescription:completeAnimation()
				self.CombatRecordCallingCardDescription:setAlpha( 1 )
				self.clipFinished( CombatRecordCallingCardDescription, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 1 )
				self.clipFinished( hintArrow, {} )
				TopFocusBar:completeAnimation()
				self.TopFocusBar:setAlpha( 1 )
				self.clipFinished( TopFocusBar, {} )
				BottomFocusBar:completeAnimation()
				self.BottomFocusBar:setAlpha( 1 )
				self.clipFinished( BottomFocusBar, {} )
			end
		},
		EmptyCallingCard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				Border:completeAnimation()
				self.Border:setAlpha( 1 )
				self.clipFinished( Border, {} )
				CardIcon:completeAnimation()
				self.CardIcon:setAlpha( 0 )
				self.clipFinished( CardIcon, {} )
				CallingCardName:completeAnimation()
				self.CallingCardName:setAlpha( 0 )
				self.clipFinished( CallingCardName, {} )
				CombatRecordCallingCardDescription:completeAnimation()
				self.CombatRecordCallingCardDescription:setAlpha( 0 )
				self.clipFinished( CombatRecordCallingCardDescription, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 0 )
				self.clipFinished( hintArrow, {} )
				TopFocusBar:completeAnimation()
				self.TopFocusBar:setAlpha( 0 )
				self.clipFinished( TopFocusBar, {} )
				BottomFocusBar:completeAnimation()
				self.BottomFocusBar:setAlpha( 0 )
				self.clipFinished( BottomFocusBar, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				CombatRecordCallingCardDescription:completeAnimation()
				self.CombatRecordCallingCardDescription:setAlpha( 0 )
				self.clipFinished( CombatRecordCallingCardDescription, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 0 )
				self.clipFinished( hintArrow, {} )
				TopFocusBar:completeAnimation()
				self.TopFocusBar:setAlpha( 1 )
				self.clipFinished( TopFocusBar, {} )
				BottomFocusBar:completeAnimation()
				self.BottomFocusBar:setAlpha( 1 )
				self.clipFinished( BottomFocusBar, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CardIcon:close()
		element.CallingCardName:close()
		element.CombatRecordCallingCardDescription:close()
		element.hintArrow:close()
		element.TopFocusBar:close()
		element.BottomFocusBar:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

