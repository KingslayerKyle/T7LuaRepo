require( "ui.uieditor.widgets.PC.ChooseCharacter.CharacterMiniSelectorItem" )
require( "ui.uieditor.widgets.PC.ChooseCharacter.CharacterMiniSelectorLeftButton" )
require( "ui.uieditor.widgets.PC.ChooseCharacter.CharacterMiniSelectorRightButton" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

DataSources.HeroesListMini = DataSourceHelpers.ListSetup( "HeroesListMini", function ( f1_arg0 )
	local f1_local0 = Engine.GetHeroList( CoD.perController[f1_arg0].customizationMode )
	local f1_local1 = {}
	for f1_local5, f1_local6 in ipairs( f1_local0 ) do
		table.insert( f1_local1, {
			models = {
				name = f1_local6.displayName,
				disabled = f1_local6.disabled,
				index = f1_local5
			}
		} )
	end
	return f1_local1
end, true )
local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0:setForceMouseEventDispatch( true )
	f2_arg0.characterGrid:setDataSource( "HeroesListMini" )
	f2_arg0:registerEventHandler( "list_active_changed", function ( element, event )
		if event.list == f2_arg0.characterGrid then
			local f3_local0 = event.model
			if f3_local0 then
				local f3_local1 = Engine.GetModel( f3_local0, "index" )
				if f3_local1 then
					f2_arg0:dispatchEventToParent( {
						name = "mini_item_selected",
						index = Engine.GetModelValue( f3_local1 ),
						controller = f2_arg1
					} )
				end
			end
		end
		return true
	end )
	f2_arg0:registerEventHandler( "sync_mini_selector", function ( element, event )
		element.characterGrid:setActiveIndex( 1, event.index )
	end )
	f2_arg0:registerEventHandler( "mini_selector_left", function ( element, event )
		SelectPreviousItemIfPossible( element, element.characterGrid, f2_arg1 )
	end )
	f2_arg0:registerEventHandler( "mini_selector_right", function ( element, event )
		SelectNextItemIfPossible( element, element.characterGrid, f2_arg1 )
	end )
end

CoD.CharacterMiniSelector = InheritFrom( LUI.UIElement )
CoD.CharacterMiniSelector.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CharacterMiniSelector )
	self.id = "CharacterMiniSelector"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 30 )
	self.anyChildUsesUpdateState = true
	
	local characterGrid = LUI.GridLayout.new( menu, controller, false, 0, 0, 4, 0, nil, nil, false, false, 0, 0, false, true )
	characterGrid:setLeftRight( true, true, 44, -44 )
	characterGrid:setTopBottom( true, true, 5, -5 )
	characterGrid:setAlpha( 0 )
	characterGrid:setDataSource( "HeroesList" )
	characterGrid:setWidgetType( CoD.CharacterMiniSelectorItem )
	characterGrid:setHorizontalCount( 9 )
	characterGrid:setSpacing( 4 )
	characterGrid:registerEventHandler( "mouse_left_click", function ( element, event )
		local f8_local0 = nil
		SelectItemIfPossible( self, element, controller, event )
		PlaySoundSetSound( self, "list_up" )
		if not f8_local0 then
			f8_local0 = element:dispatchEventToChildren( event )
		end
		return f8_local0
	end )
	self:addElement( characterGrid )
	self.characterGrid = characterGrid
	
	local leftButton = CoD.CharacterMiniSelectorLeftButton.new( menu, controller )
	leftButton:setLeftRight( true, false, 0, 30 )
	leftButton:setTopBottom( true, true, 0, 0 )
	self:addElement( leftButton )
	self.leftButton = leftButton
	
	local rightButton = CoD.CharacterMiniSelectorRightButton.new( menu, controller )
	rightButton:setLeftRight( false, true, -30, 0 )
	rightButton:setTopBottom( true, true, 0, 0 )
	self:addElement( rightButton )
	self.rightButton = rightButton
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( true, true, 30, -30 )
	FETitleNumBrdr0:setTopBottom( true, true, 0, 0 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				characterGrid:completeAnimation()
				self.characterGrid:setAlpha( 0 )
				self.clipFinished( characterGrid, {} )
				leftButton:completeAnimation()
				self.leftButton:setAlpha( 0 )
				self.clipFinished( leftButton, {} )
				rightButton:completeAnimation()
				self.rightButton:setAlpha( 0 )
				self.clipFinished( rightButton, {} )
				FETitleNumBrdr0:completeAnimation()
				self.FETitleNumBrdr0:setAlpha( 0 )
				self.clipFinished( FETitleNumBrdr0, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				characterGrid:completeAnimation()
				self.characterGrid:setLeftRight( true, true, 44, -44 )
				self.characterGrid:setTopBottom( true, true, 5, -5 )
				self.characterGrid:setAlpha( 1 )
				self.clipFinished( characterGrid, {} )
				leftButton:completeAnimation()
				self.leftButton:setAlpha( 1 )
				self.clipFinished( leftButton, {} )
				rightButton:completeAnimation()
				self.rightButton:setAlpha( 1 )
				self.clipFinished( rightButton, {} )
				FETitleNumBrdr0:completeAnimation()
				self.FETitleNumBrdr0:setLeftRight( true, true, 30, -30 )
				self.FETitleNumBrdr0:setTopBottom( true, true, 0, 0 )
				self.clipFinished( FETitleNumBrdr0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsPC() and not IsGamepad( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local f7_local5 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return f7_local5( self, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.characterGrid:close()
		element.leftButton:close()
		element.rightButton:close()
		element.FETitleNumBrdr0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

