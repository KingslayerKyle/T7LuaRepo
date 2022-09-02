-- 5c6052d92ef6d99d0effcf5073ec1825
-- This hash is used for caching, delete to decompile the file again

local PostLoadFunc = function ( self, controller, menu )
	self.setBarWidth = function ( f2_arg0, f2_arg1 )
		f2_arg0.barImage:setShaderVector( 0, f2_arg1, 0, 0, 0 )
	end
	
	if not menu or not menu:getModel() then
		return 
	else
		local f1_local0 = menu:getModel()
		local f1_local1 = Engine.GetModel( f1_local0, "frac" )
		if not f1_local1 then
			return 
		else
			self:subscribeToModel( f1_local1, function ( model )
				local modelValue = Engine.GetModelValue( model )
				if modelValue then
					local f3_local1 = 0
					if Engine.GetModel( f1_local0, "duration" ) and Engine.GetModelValue( Engine.GetModel( f1_local0, "duration" ) ) then
						f3_local1 = Engine.GetModelValue( Engine.GetModel( f1_local0, "duration" ) )
					end
					self.barImage:beginAnimation( "update", f3_local1 )
					self.barImage:setShaderVector( 0, modelValue, 0, 0, 0 )
				end
			end )
		end
	end
end

CoD.GenericUpdateBar = InheritFrom( LUI.UIElement )
CoD.GenericUpdateBar.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.GenericUpdateBar )
	self.id = "GenericUpdateBar"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 467 )
	self:setTopBottom( true, false, 0, 49 )
	
	local barImage = LUI.UIImage.new()
	barImage:setLeftRight( true, true, 0, 0 )
	barImage:setTopBottom( true, true, 0, 0 )
	barImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	barImage:setShaderVector( 0, 1, 0, 0, 0 )
	barImage:setShaderVector( 1, 0, 0, 0, 0 )
	barImage:setShaderVector( 2, 1, 0, 0, 0 )
	barImage:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( barImage )
	self.barImage = barImage
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

