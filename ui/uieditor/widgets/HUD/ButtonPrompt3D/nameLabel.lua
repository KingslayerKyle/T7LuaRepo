-- e63935bc978e5810ab3d54d55c1eb3bf
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.nameLabel = InheritFrom( LUI.UIElement )
CoD.nameLabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.nameLabel )
	self.id = "nameLabel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 106 )
	self:setTopBottom( true, false, 0, 20 )
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, true, -52.93, 49.07 )
	Glow:setTopBottom( false, false, -30, 43 )
	Glow:setAlpha( 0.14 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( true, true, -2, 3 )
	TitleGlow1:setTopBottom( true, true, -3, 3 )
	TitleGlow1:setRGB( 0.44, 0.44, 0.44 )
	TitleGlow1:setAlpha( 0.97 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local label = LUI.UITightText.new()
	label:setLeftRight( true, false, 24, 132 )
	label:setTopBottom( true, false, 0, 20 )
	label:setRGB( 0, 0, 0 )
	label:setAlpha( 0.92 )
	label:setText( Engine.Localize( "Bio-Cache" ) )
	label:setTTF( "fonts/default.ttf" )

	LUI.OverrideFunction_CallOriginalFirst( label, "setText", function ( element, controller )
		ScaleWidgetToLabelLeftJustify( self, element, -14 )
	end )
	self:addElement( label )
	self.label = label
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Small = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TitleGlow1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

