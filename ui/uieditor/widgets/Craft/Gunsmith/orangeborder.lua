-- 704ddd869f53eb7bff30f095f8945e29
-- This hash is used for caching, delete to decompile the file again

CoD.Orangeborder = InheritFrom( LUI.UIElement )
CoD.Orangeborder.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Orangeborder )
	self.id = "Orangeborder"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 48 )
	self:setTopBottom( true, false, 0, 48 )
	
	local border0 = LUI.UIImage.new()
	border0:setLeftRight( true, true, 0, 0 )
	border0:setTopBottom( true, true, 46, 0 )
	self:addElement( border0 )
	self.border0 = border0
	
	local border1 = LUI.UIImage.new()
	border1:setLeftRight( true, true, 0, 0 )
	border1:setTopBottom( true, true, 0, -46 )
	self:addElement( border1 )
	self.border1 = border1
	
	local border2 = LUI.UIImage.new()
	border2:setLeftRight( true, true, 46, 0 )
	border2:setTopBottom( true, true, 0, 0 )
	self:addElement( border2 )
	self.border2 = border2
	
	local border3 = LUI.UIImage.new()
	border3:setLeftRight( true, true, 0, -46 )
	border3:setTopBottom( true, true, 0, 0 )
	self:addElement( border3 )
	self.border3 = border3
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

