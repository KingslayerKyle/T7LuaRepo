require( "ui.uieditor.widgets.BorderBakedMask" )
require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.CAC.CustomClassListScreen.CustomClassCategoryHeader" )
require( "ui.uieditor.widgets.CAC.MenuChooseClassold.ItemWidgets.PerksWidget_old" )

CoD.SpecialtyPerksWidget_old = InheritFrom( LUI.UIElement )
CoD.SpecialtyPerksWidget_old.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SpecialtyPerksWidget_old )
	self.id = "SpecialtyPerksWidget_old"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 448 )
	self:setTopBottom( true, false, 0, 108 )
	self.anyChildUsesUpdateState = true
	
	local BorderBakedMask0 = CoD.BorderBakedMask.new( menu, controller )
	BorderBakedMask0:setLeftRight( true, true, 0, 0 )
	BorderBakedMask0:setTopBottom( true, true, 0, 0 )
	BorderBakedMask0:setRGB( 0, 0, 0 )
	BorderBakedMask0:setAlpha( 0.7 )
	self:addElement( BorderBakedMask0 )
	self.BorderBakedMask0 = BorderBakedMask0
	
	local BorderBakedSolid0 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid0:setLeftRight( true, true, 0, 0 )
	BorderBakedSolid0:setTopBottom( true, true, 0, 0 )
	BorderBakedSolid0:setRGB( 1, 1, 1 )
	BorderBakedSolid0:setAlpha( 0.25 )
	self:addElement( BorderBakedSolid0 )
	self.BorderBakedSolid0 = BorderBakedSolid0
	
	local perksHeader = CoD.CustomClassCategoryHeader.new( menu, controller )
	perksHeader:setLeftRight( true, true, -3, 4 )
	perksHeader:setTopBottom( true, false, 0, 20 )
	perksHeader:setRGB( 1, 1, 1 )
	perksHeader.text:setText( Engine.Localize( "MPUI_PERKS_CAPS" ) )
	self:addElement( perksHeader )
	self.perksHeader = perksHeader
	
	local perks1 = CoD.PerksWidget_old.new( menu, controller )
	perks1:setLeftRight( false, false, -240.5, -95.5 )
	perks1:setTopBottom( false, true, -88, 0 )
	perks1:setRGB( 1, 1, 1 )
	perks1:mergeStateConditions( {
		{
			stateName = "TwoPerks",
			condition = function ( menu, element, event )
				return IsPerk1PlusEquipped( menu, controller )
			end
		}
	} )
	if perks1.m_eventHandlers.update_class then
		local currentEv = perks1.m_eventHandlers.update_class
		perks1:registerEventHandler( "update_class", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		perks1:registerEventHandler( "update_class", LUI.UIElement.updateState )
	end
	self:addElement( perks1 )
	self.perks1 = perks1
	
	local currentEv = CoD.PerksWidget_old.new( menu, controller )
	currentEv:setLeftRight( false, false, -72.5, 72.5 )
	currentEv:setTopBottom( false, true, -88, 0 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:mergeStateConditions( {
		{
			stateName = "TwoPerks",
			condition = function ( menu, element, event )
				return IsPerk2PlusEquipped( menu, controller )
			end
		}
	} )
	if currentEv.m_eventHandlers.update_class then
		local currentEv = currentEv.m_eventHandlers.update_class
		currentEv:registerEventHandler( "update_class", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		currentEv:registerEventHandler( "update_class", LUI.UIElement.updateState )
	end
	self:addElement( currentEv )
	self.perks2 = currentEv
	
	local currentEv = CoD.PerksWidget_old.new( menu, controller )
	currentEv:setLeftRight( false, false, 93.5, 238.5 )
	currentEv:setTopBottom( false, true, -88, 0 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:mergeStateConditions( {
		{
			stateName = "TwoPerks",
			condition = function ( menu, element, event )
				return IsPerk3PlusEquipped( menu, controller )
			end
		}
	} )
	if currentEv.m_eventHandlers.update_class then
		local currentEv = currentEv.m_eventHandlers.update_class
		currentEv:registerEventHandler( "update_class", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		currentEv:registerEventHandler( "update_class", LUI.UIElement.updateState )
	end
	self:addElement( currentEv )
	self.perks3 = currentEv
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.7 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0.25 )
				self.clipFinished( BorderBakedSolid0, {} )
				perksHeader:completeAnimation()
				self.perksHeader:setAlpha( 1 )
				self.clipFinished( perksHeader, {} )
				perks1:completeAnimation()
				self.perks1:setAlpha( 1 )
				self.clipFinished( perks1, {} )
				currentEv:completeAnimation()
				self.perks2:setAlpha( 1 )
				self.clipFinished( currentEv, {} )
				currentEv:completeAnimation()
				self.perks3:setAlpha( 1 )
				self.clipFinished( currentEv, {} )
			end
		},
		NotVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.5 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0.1 )
				self.clipFinished( BorderBakedSolid0, {} )
				perksHeader:completeAnimation()
				self.perksHeader:setAlpha( 0.4 )
				self.clipFinished( perksHeader, {} )
				perks1:completeAnimation()
				self.perks1:setAlpha( 0 )
				self.clipFinished( perks1, {} )
				currentEv:completeAnimation()
				self.perks2:setAlpha( 0 )
				self.clipFinished( currentEv, {} )
				currentEv:completeAnimation()
				self.perks3:setAlpha( 0 )
				self.clipFinished( currentEv, {} )
			end
		}
	}
	self.close = function ( self )
		self.BorderBakedMask0:close()
		self.BorderBakedSolid0:close()
		self.perksHeader:close()
		self.perks1:close()
		self.perks2:close()
		self.perks3:close()
		CoD.SpecialtyPerksWidget_old.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

