require( "ui.uieditor.widgets.Border" )

CoD.StartMenu_Objectives_Item = InheritFrom( LUI.UIElement )
CoD.StartMenu_Objectives_Item.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Objectives_Item )
	self.id = "StartMenu_Objectives_Item"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1170 )
	self:setTopBottom( true, false, 0, 25 )
	
	local fill = LUI.UIImage.new()
	fill:setLeftRight( true, false, 0, 25 )
	fill:setTopBottom( false, false, -12.5, 12.5 )
	fill:setRGB( 1, 0.53, 0 )
	fill:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( fill )
	self.fill = fill
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( true, false, 0, 25 )
	border:setTopBottom( false, false, -12.5, 12.5 )
	border:setRGB( 1, 1, 1 )
	self:addElement( border )
	self.border = border
	
	local objective = LUI.UIText.new()
	objective:setLeftRight( true, true, 35, 0 )
	objective:setTopBottom( false, false, -12.5, 12.5 )
	objective:setRGB( 1, 1, 1 )
	objective:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	objective:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	objective:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	objective:linkToElementModel( self, "objective", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			objective:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( objective )
	self.objective = objective
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				fill:completeAnimation()
				self.fill:setAlpha( 0 )
				self.clipFinished( fill, {} )
			end
		},
		completed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				fill:completeAnimation()
				self.fill:setAlpha( 1 )
				self.clipFinished( fill, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "completed",
			condition = function ( menu, element, event )
				return PropertyIsTrue( self, "completed" )
			end
		}
	} )
	self.close = function ( self )
		self.border:close()
		self.objective:close()
		CoD.StartMenu_Objectives_Item.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

