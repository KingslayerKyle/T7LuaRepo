require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.CybercoreNameWidget = InheritFrom( LUI.UIElement )
CoD.CybercoreNameWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CybercoreNameWidget )
	self.id = "CybercoreNameWidget"
	self.soundSet = "CAC_LethalGrenade"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 20 )
	self.anyChildUsesUpdateState = true
	
	local nameBacking = LUI.UIImage.new()
	nameBacking:setLeftRight( true, true, 0, 0 )
	nameBacking:setTopBottom( true, true, 0, 0 )
	nameBacking:setRGB( 1, 1, 1 )
	nameBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( nameBacking )
	self.nameBacking = nameBacking
	
	local name = LUI.UIText.new()
	name:setLeftRight( true, true, 0, 0 )
	name:setTopBottom( true, false, 0, 15 )
	name:setRGB( 1, 1, 1 )
	name:setText( Engine.Localize( "" ) )
	name:setTTF( "fonts/default.ttf" )
	name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( name )
	self.name = name
	
	local focusBar = CoD.FE_FocusBarContainer.new( menu, controller )
	focusBar:setLeftRight( true, true, -2, 2 )
	focusBar:setTopBottom( false, true, -5, 2 )
	focusBar:setRGB( 1, 1, 1 )
	focusBar:setAlpha( 0 )
	focusBar:setZoom( 1 )
	self:addElement( focusBar )
	self.focusBar = focusBar
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				nameBacking:completeAnimation()
				self.nameBacking:setRGB( 0.31, 0.31, 0.31 )
				self.clipFinished( nameBacking, {} )
				name:completeAnimation()
				self.name:setRGB( 1, 1, 1 )
				self.clipFinished( name, {} )
				focusBar:completeAnimation()
				self.focusBar:setAlpha( 0 )
				self.clipFinished( focusBar, {} )
			end
		}
	}
	self.close = function ( self )
		self.focusBar:close()
		CoD.CybercoreNameWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

