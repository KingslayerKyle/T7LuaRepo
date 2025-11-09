require( "ui.uieditor.widgets.CAC.CustomClassGridScreen.LethalGrenade.LethalGrenadeModItemWidget" )

CoD.LethalGrenadeModCategoryItemWidget = InheritFrom( LUI.UIElement )
CoD.LethalGrenadeModCategoryItemWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LethalGrenadeModCategoryItemWidget )
	self.id = "LethalGrenadeModCategoryItemWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 130 )
	self:setTopBottom( true, false, 0, 89 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local modsHeaderLabel = LUI.UITightText.new()
	modsHeaderLabel:setLeftRight( true, false, 0, 44 )
	modsHeaderLabel:setTopBottom( true, false, 5, 25 )
	modsHeaderLabel:setRGB( 0.4, 0.44, 0.52 )
	modsHeaderLabel:setText( Engine.Localize( "MENU_MODS_CAPS" ) )
	modsHeaderLabel:setTTF( "fonts/default.ttf" )
	self:addElement( modsHeaderLabel )
	self.modsHeaderLabel = modsHeaderLabel
	
	local LethalGrenadeModItemWidget0 = CoD.LethalGrenadeModItemWidget.new( menu, controller )
	LethalGrenadeModItemWidget0:setLeftRight( true, true, 0, 0 )
	LethalGrenadeModItemWidget0:setTopBottom( true, true, 25, 0 )
	LethalGrenadeModItemWidget0:setRGB( 1, 1, 1 )
	self:addElement( LethalGrenadeModItemWidget0 )
	self.LethalGrenadeModItemWidget0 = LethalGrenadeModItemWidget0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				LethalGrenadeModItemWidget0:completeAnimation()
				self.LethalGrenadeModItemWidget0:setZoom( 0 )
				self.clipFinished( LethalGrenadeModItemWidget0, {} )
			end
		}
	}
	LethalGrenadeModItemWidget0.id = "LethalGrenadeModItemWidget0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.LethalGrenadeModItemWidget0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.LethalGrenadeModItemWidget0:close()
		CoD.LethalGrenadeModCategoryItemWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

