require( "ui.uieditor.widgets.CAC.ClassAllocation" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )

CoD.CACBackgroundNoHero = InheritFrom( LUI.UIElement )
CoD.CACBackgroundNoHero.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CACBackgroundNoHero )
	self.id = "CACBackgroundNoHero"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( false, false, -649, 645 )
	TitleBacking0:setTopBottom( false, false, -361, -275 )
	TitleBacking0:setRGB( 0, 0, 0 )
	TitleBacking0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local classAllocation = CoD.ClassAllocation.new( menu, controller )
	classAllocation:setLeftRight( false, true, -486, -51 )
	classAllocation:setTopBottom( true, false, 35, 70 )
	classAllocation:setRGB( 1, 1, 1 )
	classAllocation:linkToElementModel( self, nil, false, function ( model )
		classAllocation:setModel( model, controller )
	end )
	self:addElement( classAllocation )
	self.classAllocation = classAllocation
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( menu, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -72, 537 )
	cac3dTitleIntermediary0:setTopBottom( true, false, -4, 142 )
	cac3dTitleIntermediary0:setRGB( 1, 1, 1 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MULTIPLAYER" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				TitleBacking0:completeAnimation()
				self.TitleBacking0:setAlpha( 1 )
				self.clipFinished( TitleBacking0, {} )
			end
		},
		Update = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Intro = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Update2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Update3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsElementInState( element, "Update" ) then
			SetElementStateByElementName( self, "cac3dTitleIntermediary0", controller, "Update" )
		elseif IsElementInState( element, "Update2" ) then
			SetElementStateByElementName( self, "cac3dTitleIntermediary0", controller, "Update2" )
		elseif IsElementInState( element, "Update3" ) then
			SetElementStateByElementName( self, "cac3dTitleIntermediary0", controller, "Update3" )
		elseif IsElementInState( element, "Intro" ) then
			SetElementStateByElementName( self, "cac3dTitleIntermediary0", controller, "Intro" )
			PlayClipOnElement( self, {
				elementName = "heroPreview",
				clipName = "Intro"
			}, controller )
		end
	end )
	self.close = function ( self )
		self.classAllocation:close()
		self.cac3dTitleIntermediary0:close()
		CoD.CACBackgroundNoHero.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

