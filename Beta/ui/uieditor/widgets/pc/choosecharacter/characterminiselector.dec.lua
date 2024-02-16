require( "ui.uieditor.widgets.PC.ChooseCharacter.CharacterMiniSelectorItem" )
require( "ui.uieditor.widgets.PC.ChooseCharacter.CharacterMiniSelectorLeftButton" )
require( "ui.uieditor.widgets.PC.ChooseCharacter.CharacterMiniSelectorRightButton" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

local HeroesListMiniPrepare = function ( controller )
	local heroTable = Engine.GetHeroList( Engine.GetEquippedGender( controller ) )
	local infoTable = {}
	for index, heroInfo in ipairs( heroTable ) do
		table.insert( infoTable, {
			models = {
				name = heroInfo.displayName,
				disabled = REG7.disabled,
				index = index
			}
		} )
	end
	return infoTable
end

DataSources.HeroesListMini = DataSourceHelpers.ListSetup( "HeroesListMini", HeroesListMiniPrepare, true )
local PostLoadFunc = function ( self, controller )
	self:setForceMouseEventDispatch( true )
	self.characterGrid:setDataSource( "HeroesListMini" )
	self:registerEventHandler( "list_active_changed", function ( listItem, event )
		if event.list == self.characterGrid then
			local model = event.model
			if model then
				local indexModel = Engine.GetModel( model, "index" )
				if indexModel then
					local index = Engine.GetModelValue( indexModel )
					self:dispatchEventToParent( {
						name = "mini_item_selected",
						index = index,
						controller = controller
					} )
				end
			end
		end
		return true
	end )
	self:registerEventHandler( "sync_mini_selector", function ( self, event )
		self.characterGrid:setActiveIndex( 1, event.index )
	end )
	self:registerEventHandler( "mini_selector_left", function ( self, event )
		SelectPreviousItemIfPossible( self, self.characterGrid, controller )
	end )
	self:registerEventHandler( "mini_selector_right", function ( self, event )
		SelectNextItemIfPossible( self, self.characterGrid, controller )
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
		local retVal = nil
		SelectItemIfPossible( self, element, controller, event )
		PlaySoundSetSound( self, "list_up" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
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
				local f11_local0 = IsPC()
				if f11_local0 then
					f11_local0 = not IsGamepad( controller )
				end
				return f11_local0
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local currentEv = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.characterGrid:close()
		self.leftButton:close()
		self.rightButton:close()
		self.FETitleNumBrdr0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

